using Godot;
using System;
public class movement : KinematicBody2D
{
	[Export] public int Speed = 200;

	Vector2 target = new Vector2();
	Vector2 velocity = new Vector2();

	public override void _Input(InputEvent @event)
	{
		if (@event.IsActionPressed("click"))
		{
			target = GetViewport().GetMousePosition();
			
		}
		
	}

	public override void _PhysicsProcess(float delta)
	{
		velocity = (target - Position).Normalized() * Speed;
		//Rotation = velocity.Angle();
		if ((target - Position).Length() > 5)
		{
			velocity = MoveAndSlide(velocity);
		}
	}
}
