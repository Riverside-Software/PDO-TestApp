 
 /*------------------------------------------------------------------------
    File        : CarStatsGenerator
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : vza
    Created     : Tue Jul 15 13:53:28 CEST 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

USING System.*.
USING System.Windows.Forms.*.
USING System.Collections.*.

USING Infragistics.Win.UltraWinGrid.*.
USING Infragistics.Win.UltraWinDataSource.*.
USING Infragistics.Win.UltraWinCalcManager.*.

CLASS WinCalcManager.RealTimeUpdating.CarStatsGenerator:
  DEFINE VARIABLE grid                 AS UltraGrid        NO-UNDO.
  DEFINE VARIABLE dataSource           AS UltraDataSource  NO-UNDO.
  DEFINE VARIABLE calcManager          AS UltraCalcManager NO-UNDO.
  DEFINE VARIABLE tiTimer              AS Timer            NO-UNDO.
  DEFINE VARIABLE fullyAcceleratedCars AS Hashtable        NO-UNDO.

    /* Return true if a race is in progress.*/
 	DEFINE PUBLIC PROPERTY RaceInProgress AS LOGICAL NO-UNDO
	GET ():
	  RETURN THIS-OBJECT:Timer:Enabled.
	END GET.
	SET.

    /* Return the timer we use to trigger the generation of race statistics.  Lazily create one and listen to its*/
    /* OnTimerTick event if we haven't already done so.                                                          */
	DEFINE PRIVATE PROPERTY Timer AS  System.Windows.Forms.Timer  NO-UNDO
	GET():
	  IF (THIS-OBJECT:tiTimer = ?) THEN DO:
	    THIS-OBJECT:tiTimer		 = NEW Timer().
		THIS-OBJECT:tiTimer:Tick:SUBSCRIBE( THIS-OBJECT:OnTimerTick).
	  END.
	  RETURN THIS-OBJECT:tiTimer.
		
	END GET.
	SET.

 	CONSTRUCTOR PUBLIC CarStatsGenerator(grid AS UltraGrid, datasource AS UltraDataSource, calcmanager AS UltraCalcManager):
      /* Save supplied paramter in member variables. */
      initVariables().
      THIS-OBJECT:grid			= grid.
	  THIS-OBJECT:dataSource    = dataSource.
	  THIS-OBJECT:calcManager	= calcManager.
	END.	

    /* On each timer tick, update the race statistics for each car in the race (i.e., each row in the data source) using*/
    /* randomly generated values.                                                                                       */
	METHOD PRIVATE VOID OnTimerTick(sender AS OBJECT, e AS EventArgs):
	  DEFINE VARIABLE randomNumberGenerator AS Random NO-UNDO.
	  DEFINE VARIABLE oldSpeed              AS INTEGER NO-UNDO.
	  DEFINE VARIABLE newSpeed              AS INTEGER NO-UNDO.
	  DEFINE VARIABLE maxSpeed              AS INTEGER NO-UNDO.
	  DEFINE VARIABLE currentSpeed          AS INTEGER NO-UNDO.
	  DEFINE VARIABLE speedIncreasing       AS LOGICAL NO-UNDO.
	  DEFINE VARIABLE speedChg              AS DECIMAL NO-UNDO.
	  DEFINE VARIABLE speedPctChange        AS DECIMAL NO-UNDO.
	  DEFINE VARIABLE rowEnum               AS IEnumerator  NO-UNDO.
	  DEFINE VARIABLE udRow                 AS UltraDataRow NO-UNDO.

      DEFINE VARIABLE milesPerSecond            AS DECIMAL NO-UNDO.
      DEFINE VARIABLE milesTraveledThisInterval AS DECIMAL NO-UNDO.
      DEFINE VARIABLE oldMilesTraveled          AS DECIMAL NO-UNDO.

	  /* Seed a new random number generator.*/ /* TODO */
      randomNumberGenerator	= NEW Random(MTIME(NOW)).

      /* Process each row in the data source.*/
      rowEnum = CAST(THIS-OBJECT:dataSource:Rows, IEnumerable):GetEnumerator().
      DO WHILE rowEnum:MoveNext().
        DO ON ERROR UNDO, LEAVE:
          udRow = CAST(rowEnum:CURRENT, "UltraDataRow").
          oldSpeed = (udRow["CurrentSpeed"]).

          /* If the current car has fully accelerated, change its speed by some random percentage.*/
          IF (THIS-OBJECT:fullyAcceleratedCars:ContainsKey(udRow["CarNumber"])) THEN DO:
            speedIncreasing = randomNumberGenerator:NEXT(0, 100) > 40.
  		    speedChg		= randomNumberGenerator:NEXT(0, 4).
  		    speedPctChange  = speedChg / 100.

            newSpeed = oldSpeed + ((IF speedIncreasing THEN 1 ELSE -1) * speedPctChange * oldSpeed).
  		  END. /* IF (THIS-OBJECT:fullyAcce... */
  		  ELSE DO:
            /* Since the car has not fully accelerated, seed the initial speef with a random value and*/
            /* then accelerate linearly.                                                              */
  		    IF (oldSpeed = 0) THEN oldSpeed = randomNumberGenerator:Next(2, 6).
  		
  		    newSpeed = DECIMAL(oldSpeed) * 1.5.
  		    maxSpeed = udRow["MaxSpeed"].
  		    maxSpeed = maxSpeed - 10. 
  		    IF (newSpeed) > maxSpeed THEN DO:
  		      newSpeed = (udRow["MaxSpeed"]).
  		      newSpeed = newSpeed - 10.
  			  THIS-OBJECT:fullyAcceleratedCars:Add(udRow["CarNumber"], udRow["CarNumber"]).
  		    END.
  		  END. /* ELSE DO...*/

          /* Make sure the new randomly calcluated speed doesn't exceed that maximum speed of the car and update the*/
          /* data source with the new speed.                                                                        */
          maxSpeed              = udRow["MaxSpeed"].                                                                
  		  currentSpeed		    = Min(newSpeed, maxSpeed).
  		  udRow["CurrentSpeed"]	= currentSpeed.
  					
          /* Calculate the miles traveled since the last timer tick using the new speed.  Update the data source with*/
          /* the new value for miles traveled.                                                                       */
  		  milesPerSecond				= currentSpeed / 3600.
  		  milesTraveledThisInterval	= milesPerSecond / (THIS-OBJECT:tiTimer:Interval / 1000).
  		  oldMilesTraveled			= udRow["MilesTraveled"].
          udRow["MilesTraveled"]	   	= oldMilesTraveled + milesTraveledThisInterval.
        END. /* DO ON ERROR ... */
      END. /* DO WHILE ... */

      /* Make sure all calculations are complete.*/
      THIS-OBJECT:calcManager:ReCalc().

      /* Resort the rows (cars) in the grid to reflect their position in the race.*/
	  THIS-OBJECT:grid:DisplayLayout:Bands["Cars"]:SortedColumns:RefreshSort(false).


      /* Select the row in the grid that represents the leading driver.*/
	  THIS-OBJECT:grid:Rows[0]:Selected = TRUE.
    END METHOD.

  /* Stop the timer, reset the race statistics and clear the values in the grid.*/
  METHOD VOID Reset():
    DEFINE VARIABLE rowEnum AS IEnumerator  NO-UNDO.
    DEFINE VARIABLE udRow   AS UltraDataRow NO-UNDO.
    /* Stop the timer.*/
    IF (THIS-OBJECT:Timer:Enabled) THEN THIS-OBJECT:Stop().

    /* Clear the totals for each car.*/
    rowEnum = CAST(THIS-OBJECT:dataSource:Rows, IEnumerable):GetEnumerator().
    DO WHILE rowEnum:MoveNext():
      udRow = CAST(rowEnum:CURRENT, "UltraDataRow").
	  udrow["CurrentSpeed"]  = 0.
	  udrow["MilesTraveled"] = 0.0.
	END.

    /* Clear our hash table of 'fully accelerated cars'.*/
	THIS-OBJECT:fullyAcceleratedCars:Clear().
  END METHOD.


  /* Start generating race statistics.*/
  METHOD VOID Start():
    THIS-OBJECT:Timer:Interval	= INTEGER( THIS-OBJECT:calcManager:NamedReferences["RefreshInterval"]:FormulaResult:ToDouble( )).
	THIS-OBJECT:Timer:Start().
  END METHOD.

  /* Stop generating race statistics.*/
  METHOD void Stop():
    THIS-OBJECT:Timer:Stop().
  END METHOD.

  METHOD VOID initVariables():
    ASSIGN
      fullyAcceleratedCars = new Hashtable(20).
  END METHOD.

END CLASS.