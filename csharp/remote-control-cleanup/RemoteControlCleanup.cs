public class RemoteControlCar
{
    public string CurrentSponsor { get; private set; }

    public ITelemetry Telemetry { get; }

    private Speed currentSpeed;

    public RemoteControlCar()
    {
        Telemetry = new TelemetryImpl(this);
    }

    public interface ITelemetry
    {
        public void Calibrate();
        public bool SelfTest();
        public void ShowSponsor(string sponsorName);
        public void SetSpeed(decimal amount, string unitsString);
    }

    // TODO encapsulate the methods suffixed with "_Telemetry" in their own class
    // dropping the suffix from the method name
    private class TelemetryImpl: ITelemetry
    {
        RemoteControlCar car;

        public TelemetryImpl(RemoteControlCar car)
        {
            this.car = car;
        }

        public void Calibrate()
        {
        }
        
        public bool SelfTest()
        {
            return true;
        }

        public void ShowSponsor(string sponsorName)
        {
            this.car.SetSponsor(sponsorName);
        }

        public void SetSpeed(decimal amount, string unitsString)
        {
            SpeedUnits speedUnits = SpeedUnits.MetersPerSecond;
            if (unitsString == "cps")
            {
                speedUnits = SpeedUnits.CentimetersPerSecond;
            }

            this.car.SetSpeed(new Speed(amount, speedUnits));
        }
    }

    public string GetSpeed()
    {
        return currentSpeed.ToString();
    }

    private void SetSponsor(string sponsorName)
    {
        CurrentSponsor = sponsorName;

    }

    private void SetSpeed(Speed speed)
    {
        currentSpeed = speed;
    }

    private enum SpeedUnits
    {
        MetersPerSecond,
        CentimetersPerSecond
    }

    private struct Speed
    {
        public decimal Amount { get; }
        public SpeedUnits SpeedUnits { get; }

        public Speed(decimal amount, SpeedUnits speedUnits)
        {
            Amount = amount;
            SpeedUnits = speedUnits;
        }

        public override string ToString()
        {
            string unitsString = "meters per second";
            if (SpeedUnits == SpeedUnits.CentimetersPerSecond)
            {
                unitsString = "centimeters per second";
            }

            return Amount + " " + unitsString;
        }
    }
}

