>**Deprecation notice**- ga4gh-server is deprecated. PLease refer https://github.com/ga4gh/htsget-refserver which is the new implementation

# ga4gh_NeSI

- To build docker & singularity, use `./build`
- To start singularity image, first do `export REGISTRY_PATH=/wherever/something` and then `./run_ga4gh`
- MAKE SURE that the registry folder is initialized (has at least registry.db)


To run on the cluster:

1. choose a unique port that is not used by somebody else, high port numbers are probably safe,
   e.g. > 10000, here we use 10083, replace it with your chosen port in the commands below
2. set up port forwarding, e.g. on your local machine run `ssh -L 10083:localhost:10083 mahuika`
3. edit the Slurm script run_ga4gh_slurm (on the cluster)
   * set the environment variables
   * make sure to set `GA4GH_PORT` to the port you chose above
   * set the resource requirements (memory, wall time, etc)
3. submit the run script to the queue `sbatch run_ga4gh_slurm` (on the cluster)
4. check the status of the Slurm job `squeue -u $USER` (on the cluster)
5. once the job is running, on your local machine connect to http://localhost:10083/
