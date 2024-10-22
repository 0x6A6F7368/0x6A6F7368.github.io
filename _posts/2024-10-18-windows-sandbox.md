---
author: Josh
date: 2024-10-18
layout: post
title: "Windows Sandbox"
image: https://joshdawes.com/images/2024-10/windows-sandbox.png
description: Automating configuration for Windows Sandbox
permalink: /windows-sandbox/
---

![image](/images/2024-10/windows-sandbox.png){: .center-image }

Windows Sandbox is a tool from Microsoft that can create a temporary isolated Windows environments. This can be used whenever a fresh environment is required for testing - or for running malicious files.

PDF files can be opened in Edge by default, however, Office documents are not supported. To add this functionality it is possible to install Libre Office Portable. The first run of the installer cannot be automated silently. However, after manually clicking through a GUI, it is then possible to automate the process using Windows Sandbox custom configurations upon subsequent sessions.

First go all, Windows Sandbox needs to be installed. To do this, open an elevated PowerShell Prompt and run the following command:

```powershell
Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online
```

Once the command has completed a reboot of the computer may be necessary. 

Windows Sandbox configuration are stored in **wsb** files. These files use an XML format to store the configuration and can be opened directly in order to open that particular Sandbox.

Let’s first look at a simple config where a batch file is executed upon startup.

# Hello World

Let’s get started on a simple *“Hello World”* configuration.

Open a standard PowerShell prompt and run the following:

```powershell
New-Item -Path "C:\SandboxFiles\HelloWorld.wsb" -ItemType File -Force
```

Using the *-Force* command creates the file and the path in one step.

Edit the newly created file with a text editor. In this example Notepad is used:

```powershell
Start-Process notepad.exe -ArgumentList "C:\SandboxFiles\HelloWorld.wsb"
```

Paste in the following. You could also pipe to *Out-File* using PowerShell as opposed to editing with Notepad.

```powershell
<Configuration>
  <MappedFolders>
    <MappedFolder>
      <HostFolder>C:\SandboxFiles\Shared</HostFolder>
      <SandboxFolder>C:\SandboxFiles\Shared</SandboxFolder>
      <ReadOnly>true</ReadOnly>
    </MappedFolder>
  </MappedFolders>
  <LogonCommand>
    <Command>powershell -command "Start-Process cmd.exe -ArgumentList '/c C:\SandboxFiles\Shared\HelloWorld.bat'"</Command>
  </LogonCommand>
</Configuration>
```

Access to files on the host are given to the Sandbox via the *MappedFolders* element. This can be modified to link differing locations, however, it this example they have been left identical for simplicity.  It is also important to have *ReadOnly* element set to true, especially if suspicious files may be executed.

Let’s now create *HelloWorld.bat*. First of all create the file:

```powershell
New-Item -Path "C:\SandboxFiles\Shared\HelloWorld.bat" -ItemType File -Force
```

Edit the file with a text editor. In this case, Notepad. Again, you could pipe to Out-File instead of using Notepad.

```powershell
Start-Process notepad.exe -ArgumentList "C:\SandboxFiles\Shared\HelloWorld.bat"
```

Paste in the following and save the file.

```powershell
echo "Hello World"
pause
```

**HelloWorld.wsb** can now be run by double clicking the file, or by running the following command:

```powershell
WindowsSandbox "C:\SandboxFiles\HelloWorld.wsb"
```

A temporary Sandbox environment has now been created. This will be destroyed when the Sandbox is closed. 

# Libre Office Portable

As referenced above, Libre Office Portable can be utilised to give the Sandbox Office capabilities. The process is very similar to the Hello World example with a few modifications.

First of all create a new config file:

```powershell
New-Item -Path "C:\SandboxFiles\LibreOffice.wsb" -ItemType File -Force
```

Create a directory to store Libre Office Portable setup file

```powershell
New-Item -Path "C:\SandboxFiles\Temp" -ItemType Directory
```

Download Libre Office Portable:

```powershell
Invoke-WebRequest -Uri "https://download.documentfoundation.org/libreoffice/portable/24.8.2/LibreOfficePortable_24.8.2_MultilingualStandard.paf.exe" -OutFile "C:\SandboxFiles\Temp\LibreOfficePortable_24.8.2_MultilingualStandard.paf.exe"
```

Install Libre Office Portable to the location created above:

```powershell
Start-Process "C:\SandboxFiles\Temp\LibreOfficePortable_24.8.2_MultilingualStandard.paf.exe" -ArgumentList "/DESTINATION=C:\SandboxFiles\Shared\"
```
The will launch the GUI installer. The defaults are all fine as the install location has been set above. 

Edit the config file: 

```powershell
Start-Process notepad.exe -ArgumentList "C:\SandboxFiles\LibreOffice.wsb"
```

Paste in the following config:

```powershell
<Configuration>
  <MappedFolders>
    <MappedFolder>
      <HostFolder>C:\SandboxFiles\Shared</HostFolder>
      <SandboxFolder>C:\SandboxFiles\Shared</SandboxFolder>
      <ReadOnly>true</ReadOnly>
    </MappedFolder>
  </MappedFolders>
  <LogonCommand>
    <Command>powershell -command "Start-Process cmd.exe -ArgumentList '/c C:\SandboxFiles\Shared\LibreOffice.bat'"</Command>
  </LogonCommand>
</Configuration>
```

The configuration is similar to that above, with a minor change in the batch file that is executed on startup. Let’s create this batch file now:

```powershell
New-Item -Path "C:\SandboxFiles\Shared\LibreOffice.bat" -ItemType File -Force
```

Edit the file with a text editor:

```powershell
Start-Process notepad.exe -ArgumentList "C:\SandboxFiles\Shared\LibreOffice.bat"
```

Paste in the following sand save the file.

```powershell
@echo off
xcopy "C:\SandboxFiles\Shared\LibreOfficePortable" "C:\Users\WDAGUtilityAccount\Desktop\LibreOfficePortable" /E /I /Y
start "" "C:\Users\WDAGUtilityAccount\Desktop\LibreOfficePortable\LibreOfficePortable.exe"
```

This batch files copies the LibreOfficePortable directory to the Sandboxed environment and then executes the main Application. The directory is copied to the Sandbox as it requires read/write permissions to run. If suspicious files are being executed, it is not a good idea to give the mapped folder read/write permissions.

The new Sandbox environment can now be executed:

```powershell
WindowsSandbox "C:\SandboxFiles\LibreOffice.wsb"
```

The sandbox will now run allowing suspicious office files being opened in a safe environment.

# Uninstalling Windows Sandbox

Windows Sandbox can be removed by running the following from an elevated PowerShell Prompt:

```powershell
Disable-WindowsOptionalFeature -Online -FeatureName "Containers-DisposableClientVM"
```

# GitHub

Both examples have been put together as scripts for automation on GitHub. 

[HelloWorldSandbox.ps1](https://github.com/0x6A6F7368/WindowsSandbox/blob/main/HelloWorldSandbox.ps1){:target="_blank"}

[LibreOfficeSandbox.ps1](https://github.com/0x6A6F7368/WindowsSandbox/blob/main/LibreOfficeSandbox.ps1){:target="_blank"}

# References

[Doing more with Windows Sandbox](https://jdhitsolutions.com/blog/powershell/7621/doing-more-with-windows-sandbox/){:target="_blank"}

[Customize Windows Sandbox](https://techcommunity.microsoft.com/t5/itops-talk-blog/customize-windows-sandbox/ba-p/2301354/){:target="_blank"}
