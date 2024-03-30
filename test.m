figure;
hold on;
plot(q.time(:, 1), q.signals.values(:, 1), 'r');
plot(q.time(:, 1), q.signals.values(:, 2), 'g');
plot(q.time(:, 1), q.signals.values(:, 3), 'b');
plot(q.time(:, 1), q.signals.values(:, 4), 'y');