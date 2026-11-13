import unittest

from proyecto_ia.astar import astar, manhattan, euclidiana


class TestAStar(unittest.TestCase):

    def setUp(self):
        self.laberinto = [
            [0, 0, 0, 0, 0, 0],
            [1, 1, 0, 1, 1, 0],
            [0, 0, 0, 0, 1, 0],
            [0, 1, 1, 0, 0, 0],
            [0, 0, 0, 0, 1, 0],
            [0, 1, 0, 0, 0, 0]
        ]

    def test_manhattan(self):
        self.assertEqual(manhattan((0, 0), (3, 4)), 7)

    def test_euclidiana(self):
        self.assertAlmostEqual(euclidiana((0, 0), (3, 4)), 5.0)

    def test_astar_manhattan(self):
        ruta = astar(self.laberinto, (0, 0), (5, 5), manhattan)
        self.assertIsNotNone(ruta)
        self.assertEqual(ruta[0], (0, 0))
        self.assertEqual(ruta[-1], (5, 5))

    def test_astar_euclidiana(self):
        ruta = astar(self.laberinto, (0, 0), (5, 5), euclidiana)
        self.assertIsNotNone(ruta)
        self.assertEqual(ruta[0], (0, 0))
        self.assertEqual(ruta[-1], (5, 5))

    def test_astar_laberinto_vacio(self):
        with self.assertRaises(ValueError):
            astar([], (0, 0), (1, 1), manhattan)


if __name__ == "__main__":
    unittest.main()
