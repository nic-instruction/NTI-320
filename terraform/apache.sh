#!/bin/bash
sudo rm /var/www/html/index.html                                                            # delete the default apache page
sudo echo "<html><body><h1>Hi there NTI 320</h1></body></html>" > /var/www/html/index.html  # Create custom welcome page
sudo systemctl restart apache2                                                              # Restart apache so our changes take effect
