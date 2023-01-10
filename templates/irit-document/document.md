---
title: Performance evaluation and optimization of resource set libraries
author:
  firstname: Millian
  lastname: Poquet
  title: Maître de conférences
  mail: millian.poquet@irit.fr
date: 28 septembre 2022
bibliography: biblio.bib
---

# Context {-}
Resource managers are the main middleware that enables users to execute applications on large-scale computing centers (*e.g.*, Cloud datacenters, High Performance Computing centers).
Resource managers implement scheduling and placement algorithms that can be computationally intensive.
The performance of such algorithms is critical on real computing centers if one wants the system to be reactive,
but also in simulation if one wants to reduce the time and energy consumption of experimental simulation campaigns.

Both real and simulated systems represent resources (*e.g.*, hosts, processors, cores) as unique integers,
and spend a large portion of their execution time managing such resource identifiers.
Available and allocated resources have traditionally been managed as a *flat* set of integers,
onto which the scheduling or placement algorithm do many [set operations] (unions, intersections...).
We have implemented a different approach both in the [OAR] resource manager [[CCG+05]] and in the [Batsim] resource management simulator [[DMPR16]],
which consists in managing resources as sets of intervals of integers rather than as their *flatten* counterpart.
For example, the set of resources $\{1,2,3,7\}$ is managed as the $[1,3]∪[7,7]$ interval set.

# Objective of the internship {-}
The main objective of this internship is to evaluate and optimize libraries that enable to manage sets of resources.
The first part of this internship will focus on the evaluation of already implemented interval set libraries ([intervalset], [procset.py], [procset.rs]...). This will notably consist in:

1. Designing a benchmark that is representative of the operations done by resource management algorithms.
   This will be done by instrumenting the set operations done during Batsim simulations that use classical scheduling algorithms.
2. Running the benchmark on [Grid'5000] to gather performance-related data of the various interval set implementations.

The second part of the internship will focus on the development of new implementations for the sake of comparison.

1. Libraries that manage resources as *flattened* sets. The performance of several data structures can be explored.
2. A library that manage resources as bitfields and uses vectorial instructions (SSE, AVX...) to implement fast set operations.

The third and last part of the internship will focus on the optimization of existing or new resource set libraries, depending on the results from the first two parts of the internship.

\pagebreak
# Expected skills and profile {-}

- Performance evaluation and optimization skills
- Programming skills (C++ and Python, Rust is a plus)
- A taste for experimental methods (a taste for chocolate is a plus)
- Fluent French or English

# Practical details {-}
The internship will be supervised by Millian Poquet and Adrien Faure in a convivial atmosphere `:)`.
A computer and an office will be provided, as well as a monthly internship stipend of 591 €.
Internship duration is 5-6 months.

The intership can take either take place at the [IRIT] laboratory in the [SEPIA] team on Univ Toulouse III campus, or at the [LIG] laboratory in the [DATAMOVE] team on Univ Grenoble Alpes campus.
Both teams are interested in resource management on distributed systems (HPC centers, cloud datacenters, edge architectures, IoT...) and in the ecological transition.

You can send us your application (cover letter + resume / short curriculum vitæ) by email to **[millian.poquet@irit.fr](mailto:millian.poquet@irit.fr)** or **[adrien.faure@inria.fr](mailto:adrien.faure@inria.fr)**.


# Bibliography {-}

- [[CCG+05]] Nicolas Capit, Georges da Costa, Yiannis Georgiou, Guillaume Huard, Cyrille Martin, Grégory Mounié Pierre Neyron and Olivier Richard. *A batch scheduler with high level components.* Cluster computing and Grid 2005 (CCGrid05), 2005, Cardiff, United Kingdom.
- [[DMPR16]] Pierre-François Dutot, Michael Mercier, Millian Poquet and Olivier Richard. *Batsim: a Realistic Language-Independent Resources and Jobs Management Systems Simulator.* 20th Workshop on Job Scheduling Strategies for Parallel Processing (JSSPP16), May 2016, Chicago, United States.

[OAR]: https://oar.imag.fr
[Batsim]: https://batsim.org
[Grid'5000]: https://www.grid5000.fr
[intervalset]: https://framagit.org/batsim/intervalset
[procset.py]: https://gitlab.inria.fr/bleuse/procset.py
[procset.rs]: https://github.com/adfaure/procset.rs
[set operations]: https://en.wikipedia.org/wiki/Set_(mathematics)#Basic_operations
[SEPIA]: https://www.irit.fr/en/departement/dep-architecture-systems-and-networks/sepia-team
[IRIT]: https://www.irit.fr/en
[LIG]: https://www.liglab.fr
[DATAMOVE]: https://team.inria.fr/datamove

[[CCG+05]]: https://hal.archives-ouvertes.fr/hal-00005106v1
[[DMPR16]]: https://hal.archives-ouvertes.fr/hal-01333471
