#!/bin/bash
mkdir -p wordpress/wp-content/plugins
cd wordpress || exit

# Download latest WordPress
curl -o wordpress.zip https://wordpress.org/latest.zip
unzip wordpress.zip
mv wordpress/* .
rm -rf wordpress wordpress.zip

# Download Contact Form 7
curl -L -o wp-content/plugins/contact-form-7.zip https://downloads.wordpress.org/plugin/contact-form-7.latest-stable.zip
unzip wp-content/plugins/contact-form-7.zip -d wp-content/plugins/
rm wp-content/plugins/contact-form-7.zip

# Download GTM plugin
curl -L -o wp-content/plugins/gtm.zip https://downloads.wordpress.org/plugin/duracelltomi-google-tag-manager.latest-stable.zip
unzip wp-content/plugins/gtm.zip -d wp-content/plugins/
rm wp-content/plugins/gtm.zip

# Go back to parent directory and move everything from 'wordpress' to root
cd ..
shopt -s dotglob  # Include hidden files (e.g., .htaccess if present)
mv wordpress/* .
rmdir wordpress

# Clean up CI file and this script
rm -f README.md
rm -f gitlab-ci.yml
rm -- "$0"