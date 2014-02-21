n2cms.basicstarter
==================

You can install using [Nuget](http://www.nuget.org/packages/N2CMS.BasicStarter/)

```
Install-Package N2CMS.BasicStarter
```
##### Instructions for the N2 CMS Basic Starter

1. Update N2CMS Connection string to point to DB
2. Update /Views/Shared/_layout.cshtml, or use provided /Views/Shared/_n2_layout.cshtml (note, _n2_layout.cshtml assumes bootstrap is installed; bootstrap is not actually required for this)
3. Run your project and navigate to /n2 and follow directions
    * Set Admin password
    * Install DB Tables
        Proceed to step 2
    * Option 1: Fresh Start
      * For [root node] select Roote Page (fallback)
      * For [start node] select LanguageIntersection
      * Click "add 2 nodes"
      * Proceed to Step 3
    * Option 2: Use Sample Data
      * Import data
      * Proceed to Step 3
4. Disable Installation config

If you didn't add sample data, when the site comes up, right click on "Start Page" and add a start page.
