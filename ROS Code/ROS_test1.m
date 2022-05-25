%Using latest version of Matlab offered by Matlab Online
%System requirements btwn Matlab and ROS:
%https://www.mathworks.com/help/ros/gs/ros-system-requirements.html

%May need to end up downloading Matlab 2021b version onto PC b/c Matlab
%Online only offers the latest release; which happens to be R2022a. This
%latest version requires Ubuntu 20  OS and Noetic ROS2. Thus, downloading
%R2021b is the only option at the moment. '

%updating cmake: https://askubuntu.com/questions/225579/how-to-check-whether-cmake-is-installed-in-ubuntu
%Setting up Path to python exe file in Ubuntu:https://www.tutorialspoint.com/python/python_environment.htm
%https://www.mathworks.com/matlabcentral/answers/570871-error-using-ros-ros2-internal-createorgetlocalpython
%https://www.mathworks.com/help/matlab/matlab_external/install-supported-python-implementation.html
%https://www.mathworks.com/matlabcentral/answers/1631855-unable-to-get-matlab-to-recognize-the-python-installed-on-my-computer
%https://gist.github.com/plembo/6bc141a150cff0369574ce0b0a92f5e7
%https://linuxhint.com/update_alternatives_ubuntu/
%https://askubuntu.com/questions/1292972/importerror-cannot-import-name-sysconfig-from-distutils-usr-lib-python3-9
%https://unix.stackexchange.com/questions/410579/change-the-python3-default-version-in-ubuntu


%Testing ROS connection using cmds provided by the following link:
%https://www.mathworks.com/help/ros/ref/rosinit.html
%Must have roscore running in linux terminal (bash based)

%due to a requirement of python 3.9, need to determine the python version
%pe = pyenv;
%pe.Version

%I have python version 2.7, need to update to 3.9
%used the following link: 
%https://www.itsupportwale.com/blog/how-to-upgrade-to-python-3-9-0-on-ubuntu-18-04-lts/

%doing the ros initialize test again
%rosinit


%it didn't work, so need to use the soln provided from another source:
%Need to create another 
%https://www.mathworks.com/matlabcentral/answers/1690800-error-in-building-custom-ros-messages/?s_tid=ans_lp_feed_leaf

%but would need to create python virtual env for system:
%https://linuxize.com/post/how-to-create-python-virtual-environments-on-ubuntu-18-04/


% let's try the soln provided in the following link 1st:
%https://www.mathworks.com/help/ros/gs/ros-system-requirements.html
%need to set the python environment to be set at the requested python
%version.

%pyenv('Version','3.9')
%the executable files are found under the path dictated below in Version.
%but it's giving me python3.8 not python3.9.....
%pyenv(Version='/usr/bin/python3',ExecutionMode = 'OutOfProcess')

%below don't work....
%pyenv(Version='/usr/lib/python3.9',ExecutionMode = 'OutOfProcess')
%pyenv(Version='/home/server/.pyenv/versions',ExecutionMode = 'OutOfProcess')
%pyenv(Version='/home/server/.pyenv/shims/python',ExecutionMode = 'OutOfProcess')


%To set up the prescribed executable
%from link: https://www.mathworks.com/help/matlab/matlab_external/install-supported-python-implementation.html
%pyenv('Version','executable'); where executable is the file path for the
%pythonV.exe file
%pyenv('Version','/home/server/.pyenv/versions/3.9.0/bin/python3')

%https://www.mathworks.com/matlabcentral/answers/592918-using-matlab-with-ubuntu-anaconda-and-python
py_v= pyversion('~/.pyenv/versions/3.9.0/envs/venv_project1/bin/python3.9')
%pyenv(py_v,ExecutionMode = 'OutOfProcess')

%Thus, used this link to set up executable path for the python
%pe = pyenv;
%pe.Version


%Had to install python3.9 and pyenv for ubuntu systems. The former's link
%was given earlier. The latter is provided below:
%https://www.tecmint.com/pyenv-install-and-manage-multiple-python-versions-in-linux/

%There is concern over using the standard 'make install' cmd when installing 
% updated versions of python directly into
%the system for it removes the default version. Thus, keep in mind what
%certain cmds do as well as which Linux version u r using. 

%However the link directly above causes an issue with bashrc...so aborted
%it, but tried it again this time understanding what the issue was....
%However, make sure that ur using the instructions when it comes to edit
%the $HOME/.bashrc as follows: https://askubuntu.com/questions/1159153/how-can-i-add-some-lines-to-the-bashrc-file-in-ubuntu

% Tried using another source instead, but uses zshrc instead of bashrc:
%https://dev.to/nuculabs_dev/introduction-to-pyenv-for-linux-users-akh

%so aborted it....

%However, even setting the pointer to python3.9 created an issue where
%apt_pkg wasn't recognized....so, had to set that back to ubuntu's default
%= python3.6.
%To select the python version, need to type the cmd offered in earlier link in
%setting up python3.9 in ubuntu.

%https://www.newline.co/courses/create-a-serverless-slackbot-with-aws-lambda-and-python/installing-python-3-and-pyenv-on-macos-windows-and-linux

%So instead gonna try a new thing:
%https://www.mathworks.com/matlabcentral/answers/599311-configure-matlab-to-use-python-without-pyenv#comment_1023211


% the link states to use pyversion instead of pyenv
%[version, executable, isloaded] = pyversion
%nope, found a worthy explanation though....
%https://www.liquidweb.com/kb/how-to-install-pyenv-on-ubuntu-18-04/

% At the end, the steps that worked are as follows:
%create the linux based pyenv, need a combination of the 4 links below:
%https://www.tecmint.com/pyenv-install-and-manage-multiple-python-versions-in-linux/
%https://askubuntu.com/questions/1159153/how-can-i-add-some-lines-to-the-bashrc-file-in-ubuntu
%https://answers.ros.org/question/87866/how-to-edit-the-bashrc-file/
%https://www.newline.co/courses/create-a-serverless-slackbot-with-aws-lambda-and-python/installing-python-3-and-pyenv-on-macos-windows-and-linux

%https://github.com/pyenv/pyenv
%https://www.itsupportwale.com/blog/how-to-upgrade-to-python-3-9-0-on-ubuntu-18-04-lts/
%https://www.mathworks.com/matlabcentral/answers/599311-configure-matlab-to-use-python-without-pyenv#comment_1023211
%https://www.mathworks.com/help/matlab/ref/pyenv.html
%https://www.mathworks.com/help/matlab/ref/pyenv.html
%https://www.mathworks.com/help/matlab/ref/setenv.html

%% Now downloading Matlab 2021b
%Installing and launching Matlab in linux required a combination of
%websites due to the nuances of the overall process. 
%Needed to be a student at a university that was given full Matlab Online
%access.

%https://linuxconfig.org/how-to-install-matlab-on-ubuntu-18-04-bionic-beaver-linux
%https://askubuntu.com/questions/401948/how-to-create-launcher-icon
%https://www.mathworks.com/matlabcentral/answers/20-how-do-i-make-a-desktop-launcher-for-matlab-in-linux
%https://www.mathworks.com/help/matlab/ref/matlablinux.html
%https://www.mathworks.com/matlabcentral/answers/142271-matlab-seems-to-install-fine-but-will-not-run-in-ubuntu-14-04-no-error-message-provided
%https://www.mathworks.com/matlabcentral/answers/1577800-cannot-install-matlab-on-ubuntu-18-04
%https://www.mathworks.com/matlabcentral/answers/502799-license-manager-error-9-your-username-does-not-match-the-username-in-the-license-file
%https://www.mathworks.com/matlabcentral/answers/555697-matlab-activation-from-ubuntu-terminal
%https://www.mathworks.com/matlabcentral/answers/99457-how-do-i-activate-matlab-or-other-mathworks-products
%https://askubuntu.com/questions/208431/failed-to-load-module-canberra-gtk-module
%https://www.mathworks.com/matlabcentral/answers/472134-gtk-message-10-32-31-466-failed-to-load-module-canberra-gtk-module
%https://github.com/MajeurAndroid/java-adb-remote-screen/issues/14
%https://www.ubuntututorials.org/fix-Gtk-Message-failed-to-load-module-canberra-gtk-module-ubuntu-2004/


%matlab support when launching:
%https://www.mathworks.com/matlabcentral/answers/1577800-cannot-install-matlab-on-ubuntu-18-04

%How do I install on Ubuntu? -




%After the whole downloading, installation, launching the activation window
%is complete, can then finally run the application by typing 'matlab' in
%the shell. 


%% And now rosinit can work on the downloaded matlab program. 
%need

%https://www.mathworks.com/help/ros/ref/rosinit.html
%And the links provided by Ronal and Aycan. 

%https://www.mathworks.com/help/ros/ug/get-started-with-ros.html

%https://www.mathworks.com/products/ros.html








