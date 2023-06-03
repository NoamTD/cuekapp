# cuekapp

I'm a software engineer who's tired of dealing with helm templating and the overall unsatisfactory user experience that helm provides.

After looking around for a replacement, I found two awesome tools that work hand in hand:

* [kapp](https://github.com/carvel-dev/kapp) - a little tool that provides what I really love about the helm tool - managing a set of kubernetes resources as a group. It does that, and it does it well - providing the freedom to use more powerful tools for templating.
* [cue](https://cuelang.org/) - by far the best data validation/templating language out there

combining the two, I believe the workflow for managing apps k8s can be greatly improved

## The Goal of this repository

I will use this repository to evolve my ideas around the ideal setup for managing apps on k8s. This may involve developing tooling (most likely in `go`), and standard examples for utilizing the methodology.

## Prerequisites

* `kapp` and `cue` must be installed to work with this repository. Instructions can be found in the above links.

## Directories

- [./app](./app) - contains a generic `cuelang` package for deploying an app to `k8s`
- [./deploy](./deploy) - imports the `app` and describes the environments in which it will be deployed
