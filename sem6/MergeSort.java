package cz.sort;

import java.util.Arrays;
import java.util.Random;

public class MergeSort {

	public int A[] = null;

	public MergeSort(int size) {
		A = new int[size];
	}

	public void merge(int p, int q, int r) {
		int n1 = q - p + 1;
		int n2 = r - q;

		int L[] = new int[n1 + 1];
		int R[] = new int[n2 + 1];

		for (int i = 0; i < n1; i++) {
			L[i] = A[p + i];
		}

		for (int j = 0; j < n2; j++) {
			R[j] = A[q + j + 1];
		}

		L[n1] = Integer.MAX_VALUE;
		R[n2] = Integer.MAX_VALUE;

		int i = 0;
		int j = 0;

		for (int k = p; k < r + 1; k++) {
			if (L[i] <= R[j]) {
				A[k] = L[i];
				i++;
			} else {
				A[k] = R[j];
				j++;
			}
		}
	}

	public void sort(int p, int r) {
		if (p < r) {
			int q = ((p + r) / 2);

			sort(p, q);
			sort(q + 1, r);
			merge(p, q, r);
		}
	}

	public boolean isSorted() {
		for (int i = 1; i < A.length; i++) {
			if (A[i - 1] > A[i])
				return false;
		}

		return true;
	}

	public static void main(String[] args) {

		final int N = 1000;

		MergeSort ms = new MergeSort(N);

		Random r = new Random();

		for (int i = 0; i < N; i++) {
			ms.A[i] = r.nextInt(10000);
		}

		System.out.println("Before sort:");
		Arrays.stream(ms.A).forEach(System.out::println);

		ms.sort(0, N - 1);

		System.out.println("After sort:");
		Arrays.stream(ms.A).forEach(System.out::println);

		if (ms.isSorted())
			System.out.println("Sorted");
		else
			System.out.println("ERR");

	}

}
