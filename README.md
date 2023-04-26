# Auto Update System Script

The `autoupdate.sh` script is a Bash script that automatically updates the system packages if it has been one week since the last update. It also writes the date of the last update to a file, which is used to determine when the script should run again.

## System Requirements

The script requires an Ubuntu based distro to run. It was written and tested on POP!_OS but should work fine on any Ubuntu based distro using the apt package manager. 

## Usage

To use the script, add `./autoupdate/autoupdate.sh` to your ~/.bashrc or ~/.zshrc file. Restart your terminal and voila!

## Logs

The log folder contains the different log files used by the script. `autoupdate.log` is the main log file that is for the user. `autoupdate_error.log` is used by the script for error output if the update process fails. `autoupdate_last_exec.log` is used by the script to determine the last time that the script was run.

## License
This script is licensed under the GNU General Public License (GPLv3) License. See the `LICENSE` file for more information.
