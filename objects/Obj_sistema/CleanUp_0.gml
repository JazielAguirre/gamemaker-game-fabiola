/// Evento Clean Up

// Borrar la matriz de la memoria si existe
if (variable_global_exists("mapa_grid") && ds_exists(global.mapa_grid, ds_type_grid)) {
    ds_grid_destroy(global.mapa_grid);
}