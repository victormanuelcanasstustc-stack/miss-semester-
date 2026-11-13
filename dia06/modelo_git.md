flowchart TB
    subgraph REFERENCIAS["Referencias"]
        MAIN["main"]
        ACT["actividad6-rama"]
        ALT["actividad6-alternativa"]
        ORIGIN["origin/main"]
    end

    subgraph COMMITS["Objetos commit"]
        C6["b462fc8 - Fusion"]
        C5["41c4969 - Rama alternativa"]
        C4["79cf3ca - Rama principal"]
        C3["69f4ed2 - Archivos base"]
        C2["6a37f73 - Día 05"]
        C1["9f3eb2a - Día 04"]
        C0["fc96e67 - Día 03"]
    end

    subgraph TREES["Objetos tree"]
        T1["Tree a6aa8b3"]
        T2["Tree c60da13"]
        T3["Tree 5b29e85"]
    end

    subgraph ARCHIVOS["Objetos blob"]
        B1["datos.txt"]
        B2["programa_lento.py"]
        B3["programa_optimizado.py"]
    end

    MAIN --> C2
    ORIGIN --> C2
    ACT --> C6
    ALT --> C5

    C6 -->|padre 1| C4
    C6 -->|padre 2| C5
    C4 --> C3
    C5 --> C3
    C3 --> C2
    C2 -->|padre| C1
    C1 -->|padre| C0

    C2 -->|árbol| T1
    C1 -->|árbol| T2
    C0 -->|árbol| T3

    T1 --> B1
    T1 --> B2
    T1 --> B3