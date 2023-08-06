#
# Cookbook:: win_package_install
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

# This isntalls an .exe package by using a remote dir, remote file, and install resources.

# Setup a local dir to hold the downloaded files.
remote_directory "C:\\temp\\treesize" do
  action :create
  rights :full_control, 'Everyone'
  overwrite true
  recursive true
end

# Downloading file from file share. In this case using iis with directory browsing enabled for simple repo of downloadable files.
remote_file "C:\\temp\\treesize\\TreeSizeFree.exe" do
    source "http://192.168.0.31/shared/TreeSizeFreeSetup.exe"
end

# install the software. For .exe installers, use the "inno" installer_type.
windows_package "TreeSize Free Install" do
    source "C:\\temp\\treesize\\TreeSizeFree.exe"
    installer_type :inno
    action :install
   end


