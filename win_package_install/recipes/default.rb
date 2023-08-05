#
# Cookbook:: win_package_install
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

# This isntalls an .exe package by using a remote dir, remote file, and install resources.
# Large files like installers cannot be installed to chef manage, so we're
# using iis with "enable directory browsing" in iis to store larger files.


# Create the local dir with files. 
# By default it looks to see that files/default/treesize exists in the cookbook. 
# It will copy the dir with it's files to the path shown before "do" below
remote_directory "C:\\temp\\treesize" do
  action :create
  rights :full_control, 'Everyone'
  overwrite true
  recursive true
end

# Downloading file from iis website on dc31
remote_file "C:\\temp\\treesize\\TreeSizeFree.exe" do
    #source "https://downloads.jam-software.de/treesize_free/TreeSizeFree-Portable.zip"
    source "http://192.168.0.31/shared/TreeSizeFreeSetup.exe"
end

 # install the software. For .exe installers, use the "inno" installer_type.
windows_package "TreeSize Free Install" do
    source "C:\\temp\\treesize\\TreeSizeFree.exe"
    installer_type :inno
    action :install
   end


