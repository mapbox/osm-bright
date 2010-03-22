/*******************************************************************************
# Railways
*******************************************************************************/

.rail.line {
  line-cap: butt;
  outline-cap: butt;
}

.rail.line[zoom>=12][zoom<15][railway='rail'] { line-color: #bbb; }
  .rail.line.main[zoom=12][railway='rail'] { line-width: 0.5; }
  .rail.line.main[zoom=13][railway='rail'] { line-width: 1; }
  .rail.line.main[zoom=14][railway='rail'] { line-width: 1.5; }

.rail.line[zoom>=15][railway='rail'] {
    inline-color: #aaa;
    line-color: #e8e8e8;
    outline-color: #aaa;
    outline-width: 0.8;
  }
  .rail.line.main[zoom=15][railway='rail'] { 
    inline-width: 4;
    inline-dasharray: 1, 5;
    line-width: 1;
  }
  .rail.line.main[zoom=16][railway='rail'] { 
    inline-width: 5;
    inline-dasharray: 1, 6;
    line-width: 1.5;
  }
  .rail.line.main[zoom=17][railway='rail'] { 
    inline-width: 6;
    inline-dasharray: 1, 7;
    line-width: 2;
  }
  .rail.line.main[zoom=18][railway='rail'] { 
    inline-width: 7;
    inline-dasharray: 1, 8;
    line-width: 2.5;
  }
