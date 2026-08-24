package ar.edu.unlp.info.oo1.Ejercicio18_FilteredSet;

//Esta es la solucion que se realiza cuando se pide:
//“Se debe crear una nueva clase que contenga un objeto de un determinado 
// tipo al cual se le delegará está responsabilidad”
//o sea HERENCIA

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class EvenNumberSetComposicion implements Set<Integer> {
	 private Set<Integer> numbers = new HashSet<>();

	    @Override
	    public boolean add(Integer number) {
	        if (number == null || number % 2 != 0) {
	            return false;
	        }

	        return numbers.add(number);
	    }

	    @Override
	    public int size() {
	        return numbers.size();
	    }

	    @Override
	    public boolean isEmpty() {
	        return numbers.isEmpty();
	    }

	    @Override
	    public boolean contains(Object o) {
	        return numbers.contains(o);
	    }

	    @Override
	    public Iterator<Integer> iterator() {
	        return numbers.iterator();
	    }

	    @Override
	    public Object[] toArray() {
	        return numbers.toArray();
	    }

	    @Override
	    public <T> T[] toArray(T[] a) {
	        return numbers.toArray(a);
	    }

	    @Override
	    public boolean remove(Object o) {
	        return numbers.remove(o);
	    }

	    @Override
	    public boolean containsAll(Collection<?> c) {
	        return numbers.containsAll(c);
	    }

	    @Override
	    public boolean addAll(Collection<? extends Integer> c) {

	        boolean modified = false;

	        for(Integer n : c) {
	            modified |= add(n);
	        }

	        return modified;
	    }

	    @Override
	    public boolean retainAll(Collection<?> c) {
	        return numbers.retainAll(c);
	    }

	    @Override
	    public boolean removeAll(Collection<?> c) {
	        return numbers.removeAll(c);
	    }

	    @Override
	    public void clear() {
	        numbers.clear();
	    }
}
