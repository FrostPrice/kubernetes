# Downgrading K3s

**Warning:** This is not designed to be used in any production environment. DO NOT try to downgrade any cluster, as an administrator you should always check before hand the compatibility of the versions of the software you are using.

You wanted to install rancher but recieved the following error:

--> **Error: chart requires kubeVersion: < X.YY.Z-Z which is incompatible with Kubernetes vX.YY.Z-Z+abc**

This means that the version of Rancher you are using is not compatible with the version of your K3s cluster. While not a problem, it's a bit of a headache.

To solve this, you can downgrade your K3s cluster to a compatible version with Rancher.

First check the Support Matrix for Rancher and realize that you could have avoided all this:

**[Rancher Support Matrix](https://www.suse.com/suse-rancher/support-matrix/all-supported-versions)**

After that, check the latest version of K3s that is compatible with your Rancher installation,basically in the error it said it.

If in the error message it said it required version bellow 1.20.0, you can downgrade your K3s cluster to 1.19.8-abc.

To do that, you can do the following:

1 - Check the CPU architecture of your machine:

```bash
uname -m
```

If installing in a Raspberry Pi, remember to get the binary with the arm64 architecture (k3s-arm64).

2 - Download the K3s binary for the version you want to install:

```bash
wget https://github.com/k3s-io/k3s/releases/download/X.YY.Z-Z/k3s
```

3 - Copt the binary to the /usr/local/bin/k3s folder:

```bash
sudo cp k3s /usr/local/bin/k3s
```

4 - Restart the K3s service:

```bash
sudo systemctl restart k3s
```
