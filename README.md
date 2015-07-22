Notes
=====
This code is first-pass.  It really needs to replace a lot of
the hard-coded numbers with variables ("#define"s) and I kind
of petered out on the comments as I went along.

The initial version had a 4/2-2/4 div/non-div thing going but
I could not get it to legitimately find a good path so I tried
a 3/3 method where it picks one divisional game per division
and that seemed to stop dead-ending.  The comments still reflect
that 4/2-2/4 method and I need to clean up the now-redundant if.

Improvements
============
Instead of printing things out, start stuffing them into a table.
This way we can print out the weeks in order instead of having 
to rearrange them by hand later.  This will also help with 
reversing course when dead ends are reached.

How to Use
==========
1. Run ./runner.sh until you get the "Done" print-out.  
2. The skeleton schedule is now in schedule.txt
3. Edit schedule.txt to rearrange weeks in desired order.
   Probably also worth renaming it to something unique
   since ./runner.sh will delete the schedule.txt file
4. Run:
        lua finisher.lua skeleton_file.txt > final_file.txt
5. ?
6. Profit

