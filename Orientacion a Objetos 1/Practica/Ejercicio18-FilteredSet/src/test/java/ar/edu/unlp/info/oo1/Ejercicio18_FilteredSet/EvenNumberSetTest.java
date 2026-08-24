package ar.edu.unlp.info.oo1.Ejercicio18_FilteredSet;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Set;

import org.junit.jupiter.api.Test;

class EvenNumberSetTest {

    @Test
    public void shouldAddEvenNumbers() {

        Set<Integer> set = new EvenNumberSetComposicion();

        assertTrue(set.add(2));

        assertEquals(1, set.size());
        assertTrue(set.contains(2));
    }

    @Test
    public void shouldNotAddOddNumbers() {

        Set<Integer> set = new EvenNumberSetComposicion();

        assertFalse(set.add(3));

        assertTrue(set.isEmpty());
    }

}
