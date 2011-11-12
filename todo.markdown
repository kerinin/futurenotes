Priorities
=======
0 Reorganize header - no 'about', account status on left as drop-down
1 Login / Registration features
2 Merge About into landing, remove search & tags & whatnot
3 Logo should link to user home page if logged in, remove 'my notes' link
4 Markdown
5 Collapse post size


Implementation Details
=======

* Cache where helpful, figure out a way for pushes to reset cache (?)
* Access control
* markdown
* bookmark to add notes
* clean up user signup flow



UI Design Details
=======
* Order Notes, tags, etc


Testing Breakdown
=======
Screenshots: UI, graphics, location of content

Cucumber: User interaction (test how invalid input are handled, not what input is invalid)

Functional: 
  - Security/Access control
  - Search results
  - Validation

Unit: Low-level algorithms



Long-term directions
========
API for reference data sources (links, photos, bugtracking, highrise case, etc)