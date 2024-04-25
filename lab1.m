% Constants
mass = 68.1; % kg
g = 9.8; % m/s^2, acceleration due to gravity
drag_coefficient = 0.25; % kg/m
time_step = 0.1; % s
total_time = 12; % s
 
 % Initial conditions
 velocity = 0; % Initial velocity is zero as the jumper starts from rest
 position = 0; % Initial position is also zero
 
 % Terminal velocity calculation
 terminal_velocity = sqrt((mass * g) / drag_coefficient);
 
 % Arrays to store results
 time_values = 0:time_step:total_time;
 velocity_values = zeros(size(time_values));
 position_values = zeros(size(time_values));
 
 % Euler method
 for i = 1:length(time_values)
 % Drag force
 drag_force = drag_coefficient * velocity^2;
 
 % Acceleration due to gravity and drag
 acceleration = (mass * g - drag_force) / mass;
 
 % Update velocity and position using Euler method
 velocity = velocity + acceleration * time_step;
 position = position + velocity * time_step;
 
 % Store values in arrays
 velocity_values(i) = velocity;
 position_values(i) = position;
 end
 
 % Plotting results
 figure;
 subplot(2,1,1);
 plot(time_values, velocity_values, 'b-', 'LineWidth', 1.5);
 xlabel('Time (s)');
 ylabel('Velocity (m/s)');
 title('Velocity vs Time');
 
subplot(2,1,2);
plot(time_values, position_values, 'r-', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Position (m)');
title('Position vs Time');

% Display terminal velocity
disp(['Terminal Velocity: ' num2str(terminal_velocity) ' m/s']);