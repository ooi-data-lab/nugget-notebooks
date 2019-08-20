# nugget-notebooks
This is a collection of Jupyter Notebooks to demonstrate downloading and manipulating OOI data for the OOI Data Lab Educational Nuggets. This is part of the OOI Synthesis and Education project conducted by Rutgers University and led by the Consortium for Ocean Leadership, tasked with reviewing and identifying datasets for educational use from OOI 1.0 (defined as instrument deployments recovered before Oct 1, 2018). See the [RU Data Review Portal](https://datareview.marine.rutgers.edu/) for progress and results.

**Contributors**: Lori Garzio and Sage Lichtenwalner 

Rutgers University Center for Ocean Observing Leadership

## Installation Instructions
Add the channel conda-forge to your .condarc. You can find out more about conda-forge from their website: https://conda-forge.org/

`conda config --add channels conda-forge`

Clone the nugget-notebooks repository

`git clone https://github.com/ooi-data-lab/nugget-notebooks.git`

Change your current working directory to the location to which you downloaded nugget-notebooks. 

`cd /Users/lgarzio/Documents/repo/nugget-notebooks/`

Create conda environment from the included environment.yml file:

`conda env create -f environment.yml`

Once the environment is done building, activate the environment:

`conda activate nugget-notebooks`

Install the toolbox to the conda environment from the root directory of the nugget-notebooks toolbox:

`pip install .`

The toolbox should now be installed to your conda environment.

To activate the jupyter notebook:

`jupyter notebook`

This will start a Jupyter notebook server in a browser window. You can then run and modify the notebooks.