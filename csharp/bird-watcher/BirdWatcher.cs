using System;

class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek()
    {
        return new int[] {0, 2, 5, 3, 7, 8, 4};
    }

    public int Today()
    {
        return this.birdsPerDay[6];
    }

    public void IncrementTodaysCount()
    {
        this.birdsPerDay[6]++;
    }

    public bool HasDayWithoutBirds()
    {
        foreach(int birdCount in this.birdsPerDay)
        {
            if(birdCount == 0) return true;
        }
        return false;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int total = 0;
        for(int i = 0; i < numberOfDays; i++)
            total += this.birdsPerDay[i];
        return total;
    }

    public int BusyDays()
    {
        int busyDays = 0;
        foreach(int birdCount in this.birdsPerDay)
            if(birdCount >= 5) busyDays++;
        return busyDays;
    }
}
