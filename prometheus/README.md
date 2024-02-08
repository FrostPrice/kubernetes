# Prometheus

A Cloud Native Computing Foundation project, is a systems and service monitoring system. It collects metrics from configured targets at given intervals, evaluates rule expressions, displays the results, and can trigger alerts when specified conditions are observed.

Link for Prometheus: [Prometheus](https://prometheus.io/)
Link for Docs: [Docs](https://prometheus.io/docs/introduction/overview/)
Link for Github: [Github](https://github.com/prometheus/prometheus)
Link for Github Community: [Github Community](https://github.com/prometheus-community/helm-charts)
Link for Helm: [Helm](https://prometheus-community.github.io/helm-charts)

## Configuration

Currently, this is using the helm chart from the prometheus-community repository. You can adapt the installation by changing the `values.yaml` file. And this will install all monitoring modules.

After installation is complete, you can access the Prometheus dashboard by using the following credentials:

- **Username:** admin
- **Password:** prom-operator

A good Dashboard to import is the one with ID `1860`, which contains all the information for the Nodes System.

If you need a more objective dashboard, you can use ID `6417`.

## Install

To install the Prometheus, run the following command:

```bash
./install.sh
```

## Uninstall

To uninstall the Prometheus, run the following command:

```bash
./uninstall.sh
```
