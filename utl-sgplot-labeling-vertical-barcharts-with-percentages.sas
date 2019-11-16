Sgplot labeling vertical barchats with percentages                                                                                                                
                                                                                                                                                                  
I think there is an issue with labeling vertical barcharts.                                                                                                       
It seems to require a template to label bars with percents..                                                                                                      
                                                                                                                                                                  
output graph                                                                                                                                                      
https://tinyurl.com/yjj8t3zl                                                                                                                                      
https://github.com/rogerjdeangelis/utl-sgplot-labeling-vertical-barcharts-with-percentages/blob/master/utl-sgplot-labeling-vertical-barcharts-with-percentages.png
                                                                                                                                                                  
github                                                                                                                                                            
https://tinyurl.com/yguapyle                                                                                                                                      
https://github.com/rogerjdeangelis/utl-sgplot-labeling-vertical-barcharts-with-percentages                                                                        
                                                                                                                                                                  
*_                   _                                                                                                                                            
(_)_ __  _ __  _   _| |_                                                                                                                                          
| | '_ \| '_ \| | | | __|                                                                                                                                         
| | | | | |_) | |_| | |_                                                                                                                                          
|_|_| |_| .__/ \__,_|\__|                                                                                                                                         
        |_|                                                                                                                                                       
;                                                                                                                                                                 
                                                                                                                                                                  
                                                                                                                                                                  
SASHELP.CLASS total obs=19                                                                                                                                        
                                                                                                                                                                  
  NAME       SEX    AGE    HEIGHT    WEIGHT                                                                                                                       
                                                                                                                                                                  
  Alfred      M      14     69.0      112.5                                                                                                                       
  Alice       F      13     56.5       84.0                                                                                                                       
  Barbara     F      13     65.3       98.0                                                                                                                       
  Carol       F      14     62.8      102.5                                                                                                                       
  Henry       M      14     63.5      102.5                                                                                                                       
  James       M      12     57.3       83.0                                                                                                                       
  Jane        F      12     59.8       84.5                                                                                                                       
  Janet       F      15     62.5      112.5                                                                                                                       
  Jeffrey     M      13     62.5       84.0                                                                                                                       
  John        M      12     59.0       99.5                                                                                                                       
  Joyce       F      11     51.3       50.5                                                                                                                       
  Judy        F      14     64.3       90.0                                                                                                                       
  Louise      F      12     56.3       77.0                                                                                                                       
  Mary        F      15     66.5      112.0                                                                                                                       
  Philip      M      16     72.0      150.0                                                                                                                       
  Robert      M      12     64.8      128.0                                                                                                                       
  Ronald      M      15     67.0      133.0                                                                                                                       
  Thomas      M      11     57.5       85.0                                                                                                                       
  William     M      15     66.5      112.0                                                                                                                       
                                                                                                                                                                  
                                                                                                                                                                  
*            _               _                                                                                                                                    
  ___  _   _| |_ _ __  _   _| |_                                                                                                                                  
 / _ \| | | | __| '_ \| | | | __|                                                                                                                                 
| (_) | |_| | |_| |_) | |_| | |_                                                                                                                                  
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                                                 
                |_|                                                                                                                                               
;                                                                                                                                                                 
                                                                                                                                                                  
options ps=32;                                                                                                                                                    
proc chart data=sashelp.class;                                                                                                                                    
vbar sex / box;                                                                                                                                                   
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
*                                                                                                                                                                 
 _ __  _ __ ___   ___ ___  ___ ___                                                                                                                                
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                                                               
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                                                               
| .__/|_|  \___/ \___\___||___/___/                                                                                                                               
|_|                                                                                                                                                               
;                                                                                                                                                                 
                                                                                                                                                                  
proc format;                                                                                                                                                      
   picture twodigits (round) low-high='99%';                                                                                                                      
run;                                                                                                                                                              
                                                                                                                                                                  
proc template;                                                                                                                                                    
  define statgraph pct;                                                                                                                                           
    begingraph;                                                                                                                                                   
      entrytitle 'Mean Mileage by Type';                                                                                                                          
      layout overlay;                                                                                                                                             
         barchart category=sex / stat=pct                                                                                                                         
                       barlabel=true barlabelformat=twodigits.                                                                                                    
                       BARLABELATTRS=(size=12pt);                                                                                                                 
       endlayout;                                                                                                                                                 
     endgraph;                                                                                                                                                    
  end;                                                                                                                                                            
run;                                                                                                                                                              
                                                                                                                                                                  
proc sgrender data=sashelp.class template=pct;                                                                                                                    
run;                                                                                                                                                              
                                                                                                                                                                  
