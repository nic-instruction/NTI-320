#!/bin/bash
sudo rm /var/www/html/index.html                                                             # Delete the default apache page
sudo sh -c 'echo "<html><body><h1>Hi there NTI 320</h1></body></html>" > /Users/pippy/test'  # Create custom welcome page
sudo systemctl restart apache2                                                               # Restart apache so our changes take effect
