// Configure the Google Cloud provider
provider "google" {
 credentials = file("NTI-320-Spring-2020-d8d685d646a5.json")
 project     = "nti-320-spring-2020"
 region      = "us-central1"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = “apache-vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-central1-a"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

// Add your key
 metadata = {
   ssh-keys = "nicolebade:${file("~/.ssh/id_rsa.pub")}"
 }

// Make sure httpd is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get install apache2; systemctl enable apache2; systemctl start apache2”

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }

  }
}

// A variable for extracting the external ip of the instance
output "ip" {
 value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

resource "google_compute_firewall" "default" {
 name    = "apache-firewall"
 network = "default"

 allow {
   protocol = "tcp"
   ports    = ["80"]
 }
}
