import os, sys
import fileinput

project_name = 'XYUIFramework'
podspec_file_name = 'XYUIFramework.podspec'


new_tag = ""
lib_command = "pod lib lint --allow-warnings"
pod_push_command = "pod trunk push --allow-warnings"

#pod_push_command = 'pod repo push ' + project_name + ' ' + podspec_file_name + ' --allow-warnings'

spec_file_path = "./" + podspec_file_name
find_version_flag = False


def updateVersion():
    f = open(spec_file_path, 'r+')
    infos = f.readlines()
    f.seek(0, 0)
    file_data = ""
    new_line = ""
    global find_version_flag

    for line in infos:
        if line.find(".version") != -1:
            if find_version_flag == False:
                # find s.version = "xxxx"

                spArr = line.split('.')
                last = spArr[-1]
                last = last.replace('"', '')
                last = last.replace("'", "")
                newNum = int(last) + 1

                arr2 = line.split('"')
                arr3 = line.split("'")

                versionStr = ""
                if len(arr2) > 2:
                    versionStr = arr2[1]

                if len(arr3) > 2:
                    versionStr = arr3[1]
                numArr = versionStr.split(".")

                numArr[-1] = str(newNum)
                # rejoint string
                global new_tag
                for index,subNumStr in enumerate(numArr):
                    new_tag += subNumStr
                    if index < len(numArr)-1:
                        new_tag += "."

                # complete new_tag

                if len(arr2) > 2:
                    line = arr2[0] + '"' + new_tag + '"' + '\n'

                if len(arr3) > 2:
                    line = arr3[0] + "'" + new_tag + "'" + "\n"

                # complete new_line

                print "this is new tag  " + new_tag
                find_version_flag = True

        file_data += line


    with open(spec_file_path, 'w', ) as f1:
        f1.write(file_data)

    f.close()

    print "--------- auto update version -------- "


def libLint():
    print("-------- waiting for pod lib lint checking ...... ---------")
    os.system(lib_command)

def gitOperation():
    print "--------- waiting update git -------- "

    os.system('git add .')
    commit_desc = "version_" + new_tag
    commit_command = 'git commit -m "' + commit_desc + '"'
    os.system(commit_command)
    
    # tag
    tag_command = 'git tag -m "' + new_tag + '" ' + new_tag
    os.system(tag_command)
    
    # push tags
    os.system('git push --tags')

    # git push
    push_command = 'git push origin master'

def podPush():
    print("--------  waiting for pod push  ...... ---------")
    os.system(pod_push_command)



# run commands


updateVersion()
libLint()
gitOperation()
podPush()


