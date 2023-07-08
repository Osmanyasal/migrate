# migrate
Creates an installation script for the packages installed on your current Linux distro to be installed on a new one.

Export.sh lists all the repositories and packages that apt installed and creates an installation file based on that named "install_packages.sh"

<pre>
  #On your current machine.
  ./export.sh

  #On your new machine.
  ./install_packages.sh
</pre>

