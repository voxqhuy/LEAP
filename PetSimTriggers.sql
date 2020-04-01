-- This Trigger updates the death of an animal who falls below -50 Energy Level
CREATE TRIGGER DeathEnergyLevel on Pets
After Update
As
   Set NoCount ON
   If update(EnergyLevel)
   begin
      Update Pets set DateTimeDeath = GETDATE()
      where EnergyLevel < -50
   END