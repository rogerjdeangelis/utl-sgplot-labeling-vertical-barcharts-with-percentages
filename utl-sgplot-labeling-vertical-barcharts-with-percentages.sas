Sgplot labeling vertical barchat withe the percent Three examples                                                       
                                                                                                                        
    a. Proc template                                                                                                    
    b. DAtastep then sqplot        by High, Robin R rhigh@unmc.edu                                                      
    c. DAtastep grouped bar chart  by High, Robin R rhigh@unmc.edu                                                      
    d. Precompute percent                                                                                               
                                                                                                                        
Note sgplot histogram statement uses the default xx.xxx for percent and cannot be changed.                              
Also vbar statemet uses the default xx.xx for percent and cannot be changed.                                            
Also  histogram statement reqires a numeric argument;                                                                   
                                                                                                                        
see code on end for automatic template code.                                                                            
                                                                                                                        
Output Graphs                                                                                                           
                                                                                                                        
a. graph https://tinyurl.com/yjj8t3zl                                                                                   
b. graph https://tinyurl.com/ththcwe                                                                                    
c. graph https://tinyurl.com/ryl2d9d                                                                                    
d. graph https://tinyurl.com/yx2rcszu                                                                                   
                                                                                                                        
github                                                                                                                  
https://tinyurl.com/yguapyle                                                                                            
https://github.com/rogerjdeangelis/utl-sgplot-labeling-vertical-barcharts-with-percentages                              
                                                                                                                        
I think there is an issue with labeling vertical barcharts.                                                             
It seems to require a template to label bars with percents..                                                            
                                                                                                                        
*_                   _                                                                                                  
(_)_ __  _ __  _   _| |_                                                                                                
| | '_ \| '_ \| | | | __|                                                                                               
| | | | | |_) | |_| | |_                                                                                                
|_|_| |_| .__/ \__,_|\__|                                                                                               
        |_|                                                                                                             
;                                                                                                                       
                                                                                                                        
proc format;                                                                                                            
   picture twodigits (round) low-high='99%';                                                                            
run;                                                                                                                    
                                                                                                                        
data class;                                                                                                             
  set sashelp.class(keep=sex height);                                                                                   
  hgtGrp=(height>63);                                                                                                   
  onw=1;                                                                                                                
run;quit;                                                                                                               
                                                                                                                        
WORK.CLASS total obs=19                                                                                                 
                                                                                                                        
  SEX    HEIGHT    HGTGRP  ONW                                                                                          
                                                                                                                        
   M      69.0        1     1                                                                                           
   F      56.5        0     1                                                                                           
   F      65.3        1     1                                                                                           
   F      62.8        0     1                                                                                           
   M      63.5        1     1                                                                                           
   M      57.3        0     1                                                                                           
   F      59.8        0     1                                                                                           
   F      62.5        0     1                                                                                           
   M      62.5        0     1                                                                                           
   M      59.0        0     1                                                                                           
   F      51.3        0     1                                                                                           
   F      64.3        1     1                                                                                           
   F      56.3        0     1                                                                                           
   F      66.5        1     1                                                                                           
   M      72.0        1     1                                                                                           
   M      64.8        1     1                                                                                           
   M      67.0        1     1                                                                                           
   M      57.5        0     1                                                                                           
   M      66.5        1     1                                                                                           
                                                                                                                        
                                                                                                                        
* precompute percent for 4th solution;                                                                                  
proc sql;                                                                                                               
  create                                                                                                                
     table have as                                                                                                      
  select                                                                                                                
     sex                                                                                                                
    ,count(*) as cnt                                                                                                    
    ,cats(put(100*count(*)/(select count(*) from sashelp.class),3.),'%') as pct                                         
  from                                                                                                                  
     sashelp.class                                                                                                      
  group                                                                                                                 
     by sex                                                                                                             
;quit;                                                                                                                  
                                                                                                                        
Up to 40 obs WORK.HAVE total obs=2                                                                                      
                                                                                                                        
Obs    SEX    CNT    PCT                                                                                                
                                                                                                                        
 1      F       9    47%                                                                                                
 2      M      10    53%                                                                                                
                                                                                                                        
                                                                                                                        
*            _               _                                                                                          
  ___  _   _| |_ _ __  _   _| |_                                                                                        
 / _ \| | | | __| '_ \| | | | __|                                                                                       
| (_) | |_| | |_| |_) | |_| | |_                                                                                        
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                       
                |_|                                                                                                     
;                                                                                                                       
                                                                                                                        
See links above for hiRes plots, these are ascii plots                                                                  
                                                                                                                        
*          _                       _       _                                                                            
  __ _    | |_ ___ _ __ ___  _ __ | | __ _| |_ ___                                                                      
 / _` |   | __/ _ \ '_ ` _ \| '_ \| |/ _` | __/ _ \                                                                     
| (_| |_  | ||  __/ | | | | | |_) | | (_| | ||  __/                                                                     
 \__,_(_)  \__\___|_| |_| |_| .__/|_|\__,_|\__\___|                                                                     
                            |_|                                                                                         
;                                                                                                                       
                                                                                                                        
options ps=32;                                                                                                          
proc chart data=class;                                                                                                  
vbar sex ;                                                                                                              
run;quit;                                                                                                               
                                                                                                                        
                                                                                                                        
                                                                                                                        
             F           M                                                                                              
12 +--------------------------------+ 12                                                                                
   |                    53%         |                                                                                   
10 +                   *****        + 10                                                                                
   |        47%        *****        |                                                                                   
 9 +       *****       *****        +  9                                                                                
   |       *****       *****        |                                                                                   
 8 +       *****       *****        +  8                                                                                
   |       *****       *****        |                                                                                   
 7 +       *****       *****        +  7                                                                                
   |       *****       *****        |                                                                                   
 6 +       *****       *****        +  6                                                                                
   |       *****       *****        |                                                                                   
 5 +       *****       *****        +  5                                                                                
   |       *****       *****        |                                                                                   
 4 +       *****       *****        +  4                                                                                
   |       *****       *****        |                                                                                   
 3 +       *****       *****        +  3                                                                                
   |       *****       *****        |                                                                                   
 2 +       *****       *****        +  2                                                                                
   |       *****       *****        |                                                                                   
 1 +       *****       *****        +  1                                                                                
   |       *****       *****        |                                                                                   
   +--------------------------------+                                                                                   
             F           M                                                                                              
                                                                                                                        
                  SEX                                                                                                   
                                                                                                                        
*_            _       _            _                 __        _       _                                                
| |__      __| | __ _| |_ __ _ ___| |_ ___ _ __      \ \ _ __ | | ___ | |_                                              
| '_ \    / _` |/ _` | __/ _` / __| __/ _ \ '_ \ _____\ \ '_ \| |/ _ \| __|                                             
| |_) |  | (_| | (_| | || (_| \__ \ ||  __/ |_) |_____/ / |_) | | (_) | |_                                              
|_.__(_)  \__,_|\__,_|\__\__,_|___/\__\___| .__/     /_/| .__/|_|\___/ \__|                                             
                                          |_|           |_|                                                             
;                                                                                                                       
                                                                                                                        
             F           M                                                                                              
12 +--------------------------------+ 12                                                                                
   |                    53%         |                                                                                   
10 +                   *****        + 10                                                                                
   |        47%        *****        |                                                                                   
 9 +       *****       *****        +  9                                                                                
   |       *****       *****        |                                                                                   
 8 +       *****       *****        +  8                                                                                
   |       *****       *****        |                                                                                   
 7 +       *****       *****        +  7                                                                                
   |       *****       *****        |                                                                                   
 6 +       *****       *****        +  6                                                                                
   |       *****       *****        |                                                                                   
 5 +       *****       *****        +  5                                                                                
   |       *****       *****        |                                                                                   
 4 +       *****       *****        +  4                                                                                
   |       *****       *****        |                                                                                   
 3 +       *****       *****        +  3                                                                                
   |       *****       *****        |                                                                                   
 2 +       *****       *****        +  2                                                                                
   |       *****       *****        |                                                                                   
 1 +       *****       *****        +  1                                                                                
   |       *****       *****        |                                                                                   
   +--------------------------------+                                                                                   
             F           M                                                                                              
                                                                                                                        
                  SEX                                                                                                   
 *                                  _       _                                                                           
  ___      __ _ _ __ _ __    _ __ | | ___ | |_                                                                          
 / __|    / _` | '__| '_ \  | '_ \| |/ _ \| __|                                                                         
| (__ _  | (_| | |  | |_) | | |_) | | (_) | |_                                                                          
 \___(_)  \__, |_|  | .__/  | .__/|_|\___/ \__|                                                                         
          |___/     |_|     |_|                                                                                         
;                                                                                                                       
proc chart data=class;                                                                                                  
   vbar sex / subgroup=hgtGrp;                                                                                          
run;                                                                                                                    
                                                                                                                        
options nodate pageno=1 linesize=64 pagesize=32;                                                                        
                                                                                                                        
proc chart data=class;                                                                                                  
   vbar sex / group=hgtGrp;                                                                                             
run;quit;                                                                                                               
                                                                                                                        
 7 +---------------------------------------------+ 7                                                                    
   |                                             |                                                                      
   |       F         M         F         M       |                                                                      
   |      67%                           60%      |                                                                      
 6 +     FFFFF                         MMMMM     + 6                                                                    
   |     FFFFF                         MMMMM     |                                                                      
   |     FFFFF                         MMMMM     |                                                                      
   |     FFFFF                         MMMMM     |                                                                      
 5 +     FFFFF                         MMMMM     + 5                                                                    
   |     FFFFF                         MMMMM     |                                                                      
   |     FFFFF                         MMMMM     |                                                                      
   |     FFFFF      33%                MMMMM     |                                                                      
 4 +     FFFFF     MMMMM               MMMMM     + 4                                                                    
   |     FFFFF     MMMMM               MMMMM     |                                                                      
   |     FFFFF     MMMMM               MMMMM     |                                                                      
   |     FFFFF     MMMMM      40%      MMMMM     |                                                                      
 3 +     FFFFF     MMMMM     FFFFF     MMMMM     + 3                                                                    
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
 2 +     FFFFF     MMMMM     FFFFF     MMMMM     + 2                                                                    
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
 1 +     FFFFF     MMMMM     FFFFF     MMMMM     + 1                                                                    
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
   |     FFFFF     MMMMM     FFFFF     MMMMM     |                                                                      
   ----------------------------------------------+                                                                      
           F         M         F         M                                                                              
                                                                                                                        
         |----- 0 -----|     |----- 1 -----|      HGTGRP                                                                
                                                                                                                        
*    _                                                    _                                                             
  __| |    _ __  _ __ ___  ___ ___  _ __ ___  _ __  _   _| |_ ___                                                       
 / _` |   | '_ \| '__/ _ \/ __/ _ \| '_ ` _ \| '_ \| | | | __/ _ \                                                      
| (_| |_  | |_) | | |  __/ (_| (_) | | | | | | |_) | |_| | ||  __/                                                      
 \__,_(_) | .__/|_|  \___|\___\___/|_| |_| |_| .__/ \__,_|\__\___|                                                      
          |_|                                |_|                                                                        
;                                                                                                                       
                                                                                                                        
options nodate pageno=1 linesize=64 pagesize=32;                                                                        
                                                                                                                        
proc chart data=precompute;                                                                                             
   vbar sex / sumvar=cnt;                                                                                               
run;                                                                                                                    
                                                                                                                        
             F           M                                                                                              
12 +--------------------------------+ 12                                                                                
   |                    53%         |                                                                                   
10 +                   *****        + 10                                                                                
   |        47%        *****        |                                                                                   
 9 +       *****       *****        +  9                                                                                
   |       *****       *****        |                                                                                   
 8 +       *****       *****        +  8                                                                                
   |       *****       *****        |                                                                                   
 7 +       *****       *****        +  7                                                                                
   |       *****       *****        |                                                                                   
 6 +       *****       *****        +  6                                                                                
   |       *****       *****        |                                                                                   
 5 +       *****       *****        +  5                                                                                
   |       *****       *****        |                                                                                   
 4 +       *****       *****        +  4                                                                                
   |       *****       *****        |                                                                                   
 3 +       *****       *****        +  3                                                                                
   |       *****       *****        |                                                                                   
 2 +       *****       *****        +  2                                                                                
   |       *****       *****        |                                                                                   
 1 +       *****       *****        +  1                                                                                
   |       *****       *****        |                                                                                   
   +--------------------------------+                                                                                   
             F           M                                                                                              
                                                                                                                        
                  SEX                                                                                                   
                                                                                                                        
*                                                                                                                       
 _ __  _ __ ___   ___ ___  ___ ___                                                                                      
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                     
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                     
| .__/|_|  \___/ \___\___||___/___/                                                                                     
|_|                                                                                                                     
*          _                       _       _                                                                            
  __ _    | |_ ___ _ __ ___  _ __ | | __ _| |_ ___                                                                      
 / _` |   | __/ _ \ '_ ` _ \| '_ \| |/ _` | __/ _ \                                                                     
| (_| |_  | ||  __/ | | | | | |_) | | (_| | ||  __/                                                                     
 \__,_(_)  \__\___|_| |_| |_| .__/|_|\__,_|\__\___|                                                                     
                            |_|                                                                                         
;                                                                                                                       
                                                                                                                        
                                                                                                                        
proc format;                                                                                                            
   picture twodigits (round) low-high='99%';                                                                            
run;                                                                                                                    
                                                                                                                        
data class;                                                                                                             
  set sashelp.class(keep=sex height);                                                                                   
  hgtGrp=(height>63);                                                                                                   
  onw=1;                                                                                                                
run;quit;                                                                                                               
                                                                                                                        
proc format;                                                                                                            
   picture twodigits (round) low-high='99%';                                                                            
run;                                                                                                                    
                                                                                                                        
proc template;                                                                                                          
  define statgraph pct;                                                                                                 
    begingraph;                                                                                                         
      entrytitle 'Mean Mileage by Type';                                                                                
      layout overlay;                                                                                                   
         barchart category=sex / stat=pct barlabelattrs=(weight=bold size=12pt)                                         
          barlabel=true barlabelformat=twodigits.;                                                                      
       endlayout;                                                                                                       
     endgraph;                                                                                                          
  end;                                                                                                                  
run;                                                                                                                    
                                                                                                                        
proc sgrender data=class template=pct;                                                                                  
run;                                                                                                                    
                                                                                                                        
                                                                                                                        
*_            _       _            _                 __        _       _                                                
| |__      __| | __ _| |_ __ _ ___| |_ ___ _ __      \ \ _ __ | | ___ | |_                                              
| '_ \    / _` |/ _` | __/ _` / __| __/ _ \ '_ \ _____\ \ '_ \| |/ _ \| __|                                             
| |_) |  | (_| | (_| | || (_| \__ \ ||  __/ |_) |_____/ / |_) | | (_) | |_                                              
|_.__(_)  \__,_|\__,_|\__\__,_|___/\__\___| .__/     /_/| .__/|_|\___/ \__|                                             
                                                                                                                        
                                                                                                                        
data class;                                                                                                             
  set sashelp.class(keep=sex height);                                                                                   
  hgtGrp=(height>63);                                                                                                   
  onw=1;                                                                                                                
run;quit;                                                                                                               
                                                                                                                        
proc sgplot data=class PCTNDEC=0;                                                                                       
vbar sex / stat=percent response=onw datalabel=onw datalabelattrs=(weight=bold size=12pt) name="datPlt";                
run;quit;                                                                                                               
                                                                                                                        
 *                                 _       _                                                                            
  ___      __ _ _ __ _ __    _ __ | | ___ | |_                                                                          
 / __|    / _` | '__| '_ \  | '_ \| |/ _ \| __|                                                                         
| (__ _  | (_| | |  | |_) | | |_) | | (_) | |_                                                                          
 \___(_)  \__, |_|  | .__/  | .__/|_|\___/ \__|                                                                         
          |___/     |_|     |_|                                                                                         
;                                                                                                                       
                                                                                                                        
data class;                                                                                                             
  set sashelp.class(keep=sex height);                                                                                   
  hgtGrp=(height>63);                                                                                                   
  onw=1;                                                                                                                
run;quit;                                                                                                               
                                                                                                                        
proc sgplot data= class PCTNDEC=0 PCTLEVEL=GROUP;     * with a group var: PCTLEVEL=BY | GRAPH | GROUP;                  
vbar sex / group=hgtGrp groupdisplay=cluster clusterwidth=.75                                                           
           stat=percent response=onw datalabel=onw datalabelattrs=( weight=bold size=12pt);                             
run;quit;                                                                                                               
                                                                                                                        
                                                                                                                        
*    _                                                    _                                                             
  __| |    _ __  _ __ ___  ___ ___  _ __ ___  _ __  _   _| |_ ___                                                       
 / _` |   | '_ \| '__/ _ \/ __/ _ \| '_ ` _ \| '_ \| | | | __/ _ \                                                      
| (_| |_  | |_) | | |  __/ (_| (_) | | | | | | |_) | |_| | ||  __/                                                      
 \__,_(_) | .__/|_|  \___|\___\___/|_| |_| |_| .__/ \__,_|\__\___|                                                      
          |_|                                |_|                                                                        
;                                                                                                                       
                                                                                                                        
* precompute percent;                                                                                                   
proc sql;                                                                                                               
  create                                                                                                                
     table have as                                                                                                      
  select                                                                                                                
     sex                                                                                                                
    ,count(*) as cnt                                                                                                    
    ,cats(put(100*count(*)/(select count(*) from sashelp.class),3.),'%') as pct                                         
  from                                                                                                                  
     sashelp.class                                                                                                      
  group                                                                                                                 
     by sex                                                                                                             
;quit;                                                                                                                  
                                                                                                                        
* histogram issue with three decimal places;                                                                            
proc sgplot data=have tmplout='d:\sas\tmpunx.sas'; ;                                                                    
  vbar sex  / datalabel=pct response=cnt DATALABELATTRS=(Color=Black                                                    
Family="Arial" Size=12);                                                                                                
run;                                                                                                                    
                                                                                                                        
*_                       _       _                       _                                                              
| |_ ___ _ __ ___  _ __ | | __ _| |_ ___    ___ ___   __| | ___                                                         
| __/ _ \ '_ ` _ \| '_ \| |/ _` | __/ _ \  / __/ _ \ / _` |/ _ \                                                        
| ||  __/ | | | | | |_) | | (_| | ||  __/ | (_| (_) | (_| |  __/                                                        
 \__\___|_| |_| |_| .__/|_|\__,_|\__\___|  \___\___/ \__,_|\___|                                                        
                  |_|                                                                                                   
;                                                                                                                       
                                                                                                                        
* create template that we can edit;                                                                                     
                                                                                                                        
* this does not work;                                                                                                   
* filename tpl temp;                                                                                                    
                                                                                                                        
* histogram must have numeric x axis;                                                                                   
proc sgplot data=sashelp.class tmplout='work.test.my.catams';                                                           
  scatter x=height y=weight;;                                                                                           
run;                                                                                                                    
                                                                                                                        
* output source to log;                                                                                                 
                                                                                                                        
%inc 'work.test.my.catams';                                                                                             
                                                                                                                        
proc template;                                                                                                          
define statgraph sgplot;                                                                                                
begingraph / collation=binary;                                                                                          
layout overlay / yaxisopts=(labelFitPolicy=Split)                                                                       
y2axisopts=(labelFitPolicy=Split);                                                                                      
   ScatterPlot X=HEIGHT Y=WEIGHT / subpixel=off                                                                         
primary=true LegendLabel="WEIGHT" NAME="SCATTER";                                                                       
endlayout;                                                                                                              
endgraph;                                                                                                               
end;                                                                                                                    
run;quit;                                                                                                               
                                                                                                                        
proc sgrender data=sashelp.class template=sgplot;                                                                       
run;                                                                                                                    
                                                                                                                        
                                                                                        
                                                                                               
                                                                                                                                                                  
