# ch-inofix-theme
A bootstrap 3 based theme for Liferay 7.x

## How To Build
1. `cd $WORKSPACE/themes`
1. `git clone https://github.com/inofix/ch-inofix-theme.git`
1. `cd ch-inofix-theme`
1. `npm install`
1. `gulp build`

## Issues
Because of https://issues.liferay.com/browse/LPS-72409 the 'gulp watch' task does not work in 7.0.3. 

You will either have to stick to 7.0.2 for theme development or find a way to apply the fix to 7.0.3 GA4.

## How To Contribute
1. Fork this repository to your individual github account.
1. Clone your personal fork to your local machine.
1. Use feature branches to work on new features or known issues.
1. Merge finished features into your individual master branch and 
1. create pull-requests, to contribute your solutions to the inofix master branch.

**Stay up-to-date**

1. Change the current working directory to your local project.
1. Configure https://github.com/inofix/ch-inofix-theme as additional upstream remote (see: https://help.github.com/articles/configuring-a-remote-for-a-fork/)
1. Sync inofix-master with your individual fork (see: https://help.github.com/articles/syncing-a-fork/): 
1. Fetch upstream/master to your local copy: `git fetch upstream` 
1. Check out your fork's local 'master' branch: `git checkout master`
1. Merge the changes from 'upstream/master' into your local master branch. This brings your fork's master branch into sync with the upstream repository, without losing your local changes: `git merge upstream/master`
1. Push merged master to your individual github account and 
1. create a pull-request, to contribute your solution to the inofix master branch.


