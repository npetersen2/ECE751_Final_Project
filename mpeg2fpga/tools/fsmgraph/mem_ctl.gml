graph [
 directed 1
 node [ id 1 label "STATE_IDLE" ]
 node [ id 3 label "STATE_READ" ]
 node [ id 2 label "STATE_REFRESH" ]
 node [ id 4 label "STATE_WRITE" ]
 edge [ source 1 target 1 ] 
 edge [ source 1 target 3 ] 
 edge [ source 1 target 2 ] 
 edge [ source 1 target 4 ] 
 edge [ source 3 target 1 ] 
 edge [ source 3 target 3 ] 
 edge [ source 2 target 1 ] 
 edge [ source 4 target 1 ] 
 edge [ source 4 target 4 ] 
]
