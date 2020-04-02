
--Table Creation Files: Complete
--Data inserts: Complete
--Stored Procedure is created and now must be edited
--Triggers

--Triggers to add:
-- Age add death trigger -- I will add this within the procedure, natural death
-- Energy and Affection Decrease By time -- This might be too difficult
-- Double check existing triggers, some seem to not be working... Nevermind... If I drop tables then I lose them and have to recreate them


-- Drop table Pets;

Declare @Pet  VARCHAR(30)   = '3'--'New:03:Milo'
Declare @Action VARCHAR(20) = 
                    -- 'None'
                     'Walk'
                    -- 'Bath'
                    -- 'Cuddle'
                    -- 'Scold'
                    -- 'Praise'
                    -- 'Play'
Declare @Feed VARCHAR(20) =
                    -- 'None'
                    -- 'Tuna'
                    --'Kitty Kibble'
                     'Puppy Chow'
                    -- 'Hay'
                    -- 'Apple'
                    -- 'Cricket'
                    -- 'Unfortunate Mouse'
                    -- 'Milk'
                    -- 'Turkey'
                    -- 'Flaky Food'
    
    -- If 'View' results will show all animals and their statistics
    IF @Pet = 'View'
    BEGIN
        Select PetID
            ,p.Name As Name
            ,a.Name As Type
            ,DateTimeCreated As BirthDate
            ,DateTimeDeath As DeathDate
            ,EnergyLevel
            ,AffectionLevel
            ,s.[Description]
        From Pets p 
            Left Join Animals a on p.AnimalID = a.AnimalID
            Left Join States s on p.StateID = s.StateID 
    END

    -- If New, create the new animal as the only task in the procdure
    ELSE If left(@Pet,3) = 'New'
    BEGIN
        insert into Pets values (substring(@Pet,8,len(@Pet)-4), 
                                getdate(), 
                                NULL, 1, 1, 1, 
                                cast(substring(@Pet,5,2) as int))
        Select 'You have a new pet now!'
    END

    -- Check for animal death, if alive continue through actions and feeding
    Else If (Select DateTimeDeath From Pets Where PetID = @Pet) is Null
    Begin
        Declare @PetAnimalType int = (Select AnimalID From Pets Where PetID = @Pet)
        Declare @CurentState varchar(200) = ''

        If (@Action != 'None')
        BEGIN
            Declare @EnergyAffect int = (Select EnergyValue
                                            From Actions
                                            Where Name = @Action)
            Declare @AffectionAffect int = (Select AffectionValue
                                            From Actions
                                            Where Name = @Action)
            UPDATE Pets
            Set EnergyLevel = EnergyLevel + @EnergyAffect
                ,AffectionLevel = AffectionLevel + @AffectionAffect
            Where PetID = @Pet
            Set @CurentState = @CurentState + (Select [Description] From Actions Where Name = @Action)
        END

        If (@Feed != 'None')
        BEGIN
        Declare @FeedID int = (Select FoodID From Foods Where Name = @Feed)
        Declare @GoodFoodValue int = (Select GoodEnergyValue
                                        From Foods
                                        Where FoodID = @FeedID)
        Declare @BadFoodValue int = (Select BadEnergyValue
                                        From Foods
                                        Where FoodID = @FeedID)
                If (Select AnimalID
                    From PreferredFood
                    WHERE AnimalID = @PetAnimalType and FoodID = @FeedID) is Null
                BEGIN
                    Update Pets Set EnergyLevel = EnergyLevel + @BadFoodValue Where PetID = @Pet
                    Set @CurentState = @CurentState + 'The food you selected was not ideal X[ '
                End
                ELSE
                BEGIN
                    Update Pets Set EnergyLevel = EnergyLevel + @GoodFoodValue Where PetID = @Pet
                    Set @CurentState = @CurentState + 'The food you selected was ideal <3 '
                END
        End

        If (Select DateTimeDeath From Pets Where PetID = @Pet) is Null
        BEGIN
            Select 
                Case When @CurentState = '' Then 'Nothing new!' 
                Else @CurentState End as Details
                ,EnergyLevel
                ,AffectionLevel
                ,s.[Description] as State
            From Pets p 
                Left Join Animals a on p.AnimalID = a.AnimalID
                Left Join States s on p.StateID = s.StateID 
            Where PetID = @Pet
        END

        ELSE
        BEGIN
            Select 'Alas, your pet liveth no more. No action you take can reach beyond the grave.'
        END

    END
    ELSE 
    BEGIN
        Select 'Alas, your pet liveth no more. No action you take can reach beyond the grave.'
    END

    Select * From Pets