
#----mmmv--machine--instance--specific--section--start---------------------

if [ "$MMMV_USERSPACE_DISTRO_T1_HOME" == "" ]; then
    export MMMV_USERSPACE_DISTRO_T1_HOME="/home/mmmv/mmmv_userspace_distro_t1"
fi
MMMV_FP_COMMON_BASHRC_MAIN="$MMMV_USERSPACE_DISTRO_T1_HOME/mmmv/etc/common_bashrc/common_bashrc_main.bash"
#--------------------------------------------------------------------------
# https://stackoverflow.com/questions/55673886/what-is-the-difference-between-c-utf-8-and-en-us-utf-8-locales/
# archival copy: https://archive.vn/ivNHa
# Summary: 
#     The "C" in the "C.UTF-8" stands for "computer" and supposedly the 
#     "C.UTF-8" switches in a more computer-readable text output mode than 
#     the "en_US.UTF-8".
export LC_TIME="C.UTF-8"
export LC_ALL="C.UTF-8" # useful on FreeBSD for making the tar work
export LANG="C.UTF-8"
#--------------------------------------------------------------------------
# The 
export DISPLAY=":0"
# or supposedly in some cases 
#     xhost +local: 
# is needed to overcome the "Invalid MIT-MAGIC-COOKIE-1 keyError"
# https://unix.stackexchange.com/questions/199891/invalid-mit-magic-cookie-1-key-when-trying-to-run-program-remotely
# archival copy: https://archive.vn/mdVro
#--------------------------------------------------------------------------
export MMMV_SB_DEBUG="t"  #  domain: {"",  "t", "f"} 
                          # default: "" -> "t"
export MMMV_SB_LOOK_FOR_DEVELOPMENT_TOOLS="t" #  domain: {"",  "t", "f"} 
                                              # default: "" -> "t"
#--------------------------------------------------------------------------
# The execution of the 
#
#     source "$MMMV_FP_COMMON_BASHRC_MAIN"
#
# can take about 15s, depending on the machine that executes it. 
# Console output that is necessary for feedback may interfere with 
# the operation of the scp/sftp
#
#     https://serverfault.com/questions/485487/use-bashrc-without-breaking-sftp
#     archival copy: https://archive.vn/pxmm1
#     https://web.archive.org/web/20201029162511/https://serverfault.com/questions/485487/use-bashrc-without-breaking-sftp
#
# A workaround to both of those problems is to not output any 
# text to console during the execution of the ~/.bashrc if 
# the session is an SSH session and to switch on 
# the mmmv environment manually by executing 
alias mmmv_environment="nice -n 2 bash --rcfile \"$MMMV_FP_COMMON_BASHRC_MAIN\" "
#
# For some reason in some cases ssh login is possible
# even if the ~/.bashrc outputs text to console.
# At the time of writing this comment/sentence here, that reason
# is not known to me(Martin.Vahi@softf1.com) and I only have 
# experimental confirmation.
#
#--------------------------------------------------------------------------
# Reformatted citation from the ssh man page and the following page:
# https://unix.stackexchange.com/questions/120080/what-are-ssh-tty-and-ssh-connection
# archival copy: https://archive.vn/2y2EF
#
#     SSH_TTY    This is set to the name of the tty (path to the device) 
#                associated with the current shell or command.  
#                If the current session has no tty, this variable is not set.
#
SB_CONSOLE_IS_ACCESSED_OVER_SSH="t" # domain {"t","f"}
if [ "$SSH_TTY" == "" ]; then
    # As of 2021_07 that test has been 
    # tested to work on both, Linux and FreeBSD.
    SB_CONSOLE_IS_ACCESSED_OVER_SSH="f"
fi
# If one logs in over SSH and then starts a new Bash session by 
# executing the /bin/bash then the non-empty-string value 
# of the SSH_TTY remains, unless it is manually set to an empty string.
if [ "$SB_CONSOLE_OUTPUT_IS_ALLOWED" == "" ]; then
    SB_CONSOLE_OUTPUT_IS_ALLOWED="f" # the ssh issue as described 
                                     # earlier in this file
fi
#--------------------------------------------------------------------------
if [ "$SB_MMMV_USERSPACE_DISTRO_T1_COMMON_BASHRC_EXECUTION_ALMOST_COMPLETE" != "t" ]; then
    #----------------------------------------------------------------------
    if [ "$SB_CONSOLE_IS_ACCESSED_OVER_SSH" == "t" ]; then
        SB_CONSOLE_OUTPUT_IS_ALLOWED="f"
        # if [ "`uname -a | grep -i -E '(Microsoft|Windows)' `" ]; then
        #     # The assumption is that one usually does not want 
        #     # to log into a Windows machine over SSH.
        #     SB_CONSOLE_OUTPUT_IS_ALLOWED="t"
        # fi
    else
        SB_CONSOLE_OUTPUT_IS_ALLOWED="t"
        source "$MMMV_FP_COMMON_BASHRC_MAIN"
    fi
    #----------------------------------------------------------------------
    if [ "$SB_CONSOLE_OUTPUT_IS_ALLOWED" == "t" ]; then
        #------------------------------------------------------------------
        if [ "$SB_MMMV_USERSPACE_DISTRO_T1_COMMON_BASHRC_EXECUTION_ALMOST_COMPLETE" != "" ]; then
            if [ "$SB_MMMV_USERSPACE_DISTRO_T1_COMMON_BASHRC_EXECUTION_ALMOST_COMPLETE" != "f" ]; then
                echo ""
                echo "The environment variable "
                echo ""
                echo "    SB_MMMV_USERSPACE_DISTRO_T1_COMMON_BASHRC_EXECUTION_ALMOST_COMPLETE==$SB_MMMV_USERSPACE_DISTRO_T1_COMMON_BASHRC_EXECUTION_ALMOST_COMPLETE"
                echo ""
                echo "but its domain is: {\"\", \"t\", \"f\"}."
                echo "GUID=='354d2a14-01ac-447b-873d-024071d0a6e7'"
                echo ""
            fi
        fi
        #------------------------------------------------------------------
    fi
    #----------------------------------------------------------------------
fi
#--------------------------------------------------------------------------

#----mmmv--machine--instance--specific--section--end-----------------------

