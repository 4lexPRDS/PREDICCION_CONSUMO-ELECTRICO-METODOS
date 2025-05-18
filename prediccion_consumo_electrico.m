function prediccion_consumo_electrico
    fig = uifigure('Name','Comparación de Métodos de Interpolación','Position',[100 100 800 600], ...
                   'Color', '#E8F5E9');

    uilabel(fig, 'Text', 'Comparación de Interpolaciones del Consumo Eléctrico', ...
        'FontSize', 20, 'FontWeight', 'bold', 'FontName', 'Segoe UI', ...
        'FontColor', '#1B5E20', 'Position', [60 550 700 30]);

    uilabel(fig, 'Text', 'Ingrese los datos de consumo (meses y kWh):', ...
        'FontSize', 14, 'FontName', 'Segoe UI', 'FontColor', '#1B5E20', ...
        'Position', [50 500 400 30]);

    uilabel(fig, 'Text', 'Meses:', 'Position', [50 460 50 22], 'FontName', 'Segoe UI', 'FontColor', '#1B5E20');
    mesesField = uitextarea(fig, 'Position', [100 420 200 70], ...
        'FontName', 'Segoe UI', 'FontColor', '#1B5E20');

    uilabel(fig, 'Text', 'Consumo (kWh):', 'Position', [320 460 100 22], 'FontName', 'Segoe UI', 'FontColor', '#1B5E20');
    consumoField = uitextarea(fig, 'Position', [430 420 200 70], ...
        'FontName', 'Segoe UI', 'FontColor', '#1B5E20');

    btn = uibutton(fig, 'Text', 'Comparar Métodos', ...
        'Position', [300 370 200 40], ...
        'FontName', 'Segoe UI', 'FontWeight', 'bold', ...
        'FontColor', '#FFFFFF', 'BackgroundColor', '#388E3C', ...
        'ButtonPushedFcn', @(btn,event) compararMetodos);

    ax = uiaxes(fig, 'Position', [50 40 700 300]);
    title(ax, 'Comparación de Métodos de Interpolación', 'FontName', 'Segoe UI', 'FontSize', 14);
    xlabel(ax, 'Mes', 'FontName', 'Segoe UI');
    ylabel(ax, 'Consumo (kWh)', 'FontName', 'Segoe UI');

    function compararMetodos
        try
            x = str2double(mesesField.Value);
            y = str2double(consumoField.Value);

            if length(x) ~= length(y)
                uialert(fig, 'Los vectores deben tener la misma longitud.', 'Error');
                return;
            end

            [x, orden] = sort(x);
            y = y(orden);
            xq = linspace(min(x), max(x)+1.5, 200);
            siguiente_mes = max(x) + 1;

            hold(ax, 'off');
            plot(ax, x, y, 'ko', 'MarkerSize', 8, 'DisplayName', 'Datos reales');
            hold(ax, 'on');

            % Interpolacion Lineal
            y_lin = interp1(x, y, xq, 'linear');
            pred_lin = interp1(x, y, siguiente_mes, 'linear');
            plot(ax, xq, y_lin, '--', 'Color', '#4DB6AC', 'LineWidth', 1.5, 'DisplayName', 'Lineal');

            % Interpolacion Cuadrática 
            if length(x) >= 3
                p2 = polyfit(x(1:3), y(1:3), 2);
                y_quad = polyval(p2, xq);
                pred_quad = polyval(p2, siguiente_mes);
                plot(ax, xq, y_quad, '-', 'Color', '#00796B', 'LineWidth', 1.5, 'DisplayName', 'Cuadrática');
            else
                pred_quad = NaN;
            end

            % Interpolacion Lagrange
            y_lag = arrayfun(@(xi) lagrange(x, y, xi), xq);
            pred_lag = lagrange(x, y, siguiente_mes);
            plot(ax, xq, y_lag, '-', 'Color', '#0288D1', 'LineWidth', 1.5, 'DisplayName', 'Lagrange');

            %Interpolacion Cúbica 
            if length(x) >= 4
                p3 = polyfit(x(1:4), y(1:4), 3);
                y_cubic = polyval(p3, xq);
                pred_cubic = polyval(p3, siguiente_mes);
                plot(ax, xq, y_cubic, '-', 'Color', '#004D40', 'LineWidth', 1.5, 'DisplayName', '3er Grado');
            else
                pred_cubic = NaN;
            end

            % Predicciones mes siguiente
            plot(ax, siguiente_mes, pred_lin, '*', 'Color', '#4DB6AC', 'MarkerSize', 10);
            if ~isnan(pred_quad)
                plot(ax, siguiente_mes, pred_quad, '*', 'Color', '#00796B', 'MarkerSize', 10);
            end
            plot(ax, siguiente_mes, pred_lag, '*', 'Color', '#0288D1', 'MarkerSize', 10);
            if ~isnan(pred_cubic)
                plot(ax, siguiente_mes, pred_cubic, '*', 'Color', '#004D40', 'MarkerSize', 10);
            end

            legend(ax, 'Location', 'northwest', 'FontName', 'Segoe UI');
            hold(ax, 'off');

            % Mostrar predicciones
            msg = sprintf(['Predicciones para el mes %d:\n' ...
                           'Lineal: %.2f kWh\n' ...
                           'Cuadrática: %s\n' ...
                           'Lagrange: %.2f kWh\n' ...
                           '3er Grado: %s'], ...
                           siguiente_mes, pred_lin, ...
                           mostrar(pred_quad), pred_lag, ...
                           mostrar(pred_cubic));
            uialert(fig, msg, 'Comparación');

        catch
            uialert(fig, 'Error en los datos. Ingrese números válidos.', 'Error');
        end
    end

    % Función Lagrange
    function L = lagrange(x, y, x0)
        n = length(x);
        L = 0;
        for i = 1:n
            li = 1;
            for j = 1:n
                if j ~= i
                    li = li * (x0 - x(j)) / (x(i) - x(j));
                end
            end
            L = L + li * y(i);
        end
    end

    % Mostrar NaN como texto
    function out = mostrar(valor)
        if isnan(valor)
            out = '--- (no aplica)';
        else
            out = sprintf('%.2f kWh', valor);
        end
    end
end
