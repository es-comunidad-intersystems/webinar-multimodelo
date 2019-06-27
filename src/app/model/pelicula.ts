import { Actor } from './actor';
import { Director } from './director';

export interface Pelicula {
    id: number;
    titulo: string;
    fecha: Date;
    actores: Actor[];
    director: Director;
}
