# The Mentor Group
Teaching inner city youth machine learning as a foundation to inspire and generate minority wealth through viable career paths in the field of data science.

-------------------------------------------------------------

### Set up your developer environment for Windows 10

 - <strong>Step 1</strong> Install ConEmu:
   
   1.0 Click this to download the installer and select (x86): ```https://www.fosshub.com/ConEmu.html?dwl=ConEmuSetup.201124.exe```

   1.1 Launch ConEmu and save it to your toolbar. Then click the three bars on far right side in ConEmu at the top of the cmd line window. Adjust your settings to GitBash, as shown here:
      
      ![a](./img/con_emu.jpg)


 - <strong>Step 2</strong> Install chocolatey:

   2.0 Type ```powershell``` in the Windows 10 search bar.

   2.1 Right click the powershell icon, and select ```"Run as Administrator"```.  

   2.2 Paste this into the cmd line and run it: ```Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))```

   2.3 After it is done installing, you can close powershell.



 - <strong>Step 3</strong> Open ConEmu & run seperately: 

   3.0 ```choco install wsl2```
   
   3.1 ```choco install git -Y```

   
 - <strong>Step 4</strong> Go over to ```https://github.com``` and create your own account and repo. You will need an email account to do so. We will also create a secure RSA key so you can always access your GitHub remotely from your computer. Also, use a cool user handle for your name, but don't use your real name and select a different city than where you live for security purposes ;)

   3.0 After you create your account, go back to ConEmu, and create an SSH Key for your account: ```ssh-keygen -t rsa -b 4096 -C "your_email@example.com"```

   3.1 Navigate to folder: ```C:\Users\{{your_user_name_on_your_computer}}\.ssh\id_rsa.pub```, and open ```id_rsa_.pub```, copy the key (ctrl+c).

   3.2 After you copy the key, right-click this link, and open in new window: [https://github.com/settings/keys](https://github.com/settings/keys).
  
   3.3  Click the green button in upper right-hand side called: ```New SSH key```, then paste the key you copied in step 2 into the ```key``` box. Lastly, click ```Add SSH key``` to save it.

   3.4 Go back to ConEmu and add your user account to your GIT:

      3.4.1  ``` git config --global user.name "github user name here" ```

      3.4.2  ``` git config --global user.email "your_email@whatever.com" ```

   3.5 Use this link as a reference for later (bookmark it) to use GIT commands: [https://rogerdudler.github.io/git-guide/](https://rogerdudler.github.io/git-guide/)


 - <strong>Step 5</strong> Download Pocket for Chrome

   5.0 Save all the code tutorials you'll find to have one consolidated library to reference: [https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj](https://chrome.google.com/webstore/detail/save-to-pocket/niloccemoadcdkdjlinkgdfekeahmflj)


 - <strong>Step 6</strong> Install Docker for Windows

   6.0 In ```ConEmu``` run the following cmd: ```choco install docker-desktop```


 - <strong>Step 7 <em>(Optional-If you have an NVIDIA GPU)</em></strong> Install CUDA & NVIDIA Docker 2 for Windows 10

   7.0 Download the drivers here: [https://www.nvidia.com/Download/index.aspx](https://www.nvidia.com/Download/index.aspx)

   7.1 Install CUDA: ```choco install cuda```  


 - <strong>Step 8</strong> Download PyCharm Community or VSCode (your choice)
  
   8.0 PyCharm Community Download: [https://www.jetbrains.com/pycharm/download/#section=windows](https://www.jetbrains.com/pycharm/download/#section=windows)

   8.1 VSCode Download: [https://code.visualstudio.com/download](https://code.visualstudio.com/download)


 - <strong>Step 9</strong> Install Anaconda (latest)

   9.0 Anaconda is accelerated, scientific Python: [Download Anaconda Installer](https://repo.anaconda.com/archive/Anaconda3-2020.11-Windows-x86_64.exe)



### CPU setup for x86 on Windows 10

Step 1
```docker build -t <container name> . ``` < note the . after

If you get an authorized user from the docker pull cmd inside the container, try:

``docker logout```

...and then run it or pull again. As it is public repo you shouldn't need to login.

Step 2
Run the image, mount the volumes for Jupyter and app folder for your fav IDE, and finally the expose ports 8888 for Jupyter Notebook:

```winpty docker run --rm -it -v "${PWD}:/app" -p 8888:8888 -p 6006:6006 <container name>```

---------------------------------------------------

### GPU setup for x86 on Linux

Step 1
docker build -t <container name> . < note the . after

If you get an authorized user from the docker pull cmd inside the container, try:

```docker logout```

...and then run it or pull again. As it is public repo you shouldn't need to login.

Step 2
Run the image, mount the volumes for Jupyter and app folder for your fav IDE, and finally the expose ports 8888 for Jupyter Notebook:

```docker run --rm -it --runtime=nvidia --user $(id -u):$(id -g) --group-add container_user --group-add sudo -v "${PWD}:/app" -p 8888:8888 -p 6006:6006 <container name>```
