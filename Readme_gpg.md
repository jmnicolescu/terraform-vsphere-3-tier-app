
# Manage Passwords With GPG and Pass

### Using pass the standard unix password manager

https://www.passwordstore.org/

### To create a new GPG key, execute the following:

    \> gpg --gen-key

    You can view your GPG keys by executing the following:

    \> gpg --list-keys

    which should show something like this:

    pub   2038R/91E83BF2 2017-05-13
    uid                  Bob <name@example.com>
    sub   2038R/E3872671 2017-05-13

    Note: PUBLIC_KEY_ID is 91E83BF2

### Initializing the Password Store

    \> pass init "91E83BF2"

### Store vCenter secrets by using the pass insert command:

    \> pass insert provider_vsphere_host

    Enter password for provider_vsphere_host: ...

    \> pass insert provider_vsphere_user

    Enter password for provider_vsphere_user: ...

    \> pass insert provider_vsphere_password

    Enter password for provider_vsphere_password: ...

### Set your environment - Read secrets from pass and set them as environment variables

    export TF_VAR_provider_vsphere_host=$(pass provider_vsphere_host)

    export TF_VAR_provider_vsphere_user=$(pass provider_vsphere_user)

    export TF_VAR_provider_vsphere_password=$(pass provider_vsphere_password)

