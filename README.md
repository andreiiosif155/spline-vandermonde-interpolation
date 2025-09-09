Robot Trajectory Interpolation: Cubic Spline & Vandermonde Methods

Abstract
This project implements two numerical interpolation methods to generate smooth
trajectories for autonomous robots: Cubic Spline (C²-continuous) and Vandermonde
Polynomial interpolation. The system calculates optimal paths through predefined
waypoints, simulating the trajectory planning used in robotics competitions like
the FIRST Tech Challenge.

Implementation Overview

parse_data(filename)
- Reads interpolation nodes from a file
- First line: natural number n (number of intervals)
- Second line: n+1 integers representing x-coordinates
- Third line: n+1 integers representing y-coordinates
- Returns two column vectors x and y

spline_c2(x, y)
- Solves the 4n×4n linear system for natural cubic spline coefficients
- Ensures C² continuity (value, slope, and curvature continuity)
- Implements natural boundary conditions (second derivatives zero at endpoints)
- Returns coefficient vector

P_spline(coef, x, x_interp)
- Evaluates the piecewise cubic spline at interpolation points
- For each x_interp(i), determines the correct interval and polynomial
- Computes sⱼ(x) = aⱼ + bⱼ(x-xⱼ) + cⱼ(x-xⱼ)² + dⱼ(x-xⱼ)³
- Returns interpolated values y_interp

vandermonde(x, y)
- Constructs and solves the Vandermonde system for a single global polynomial
- Returns coefficients [a₀ a₁ a₂ ... aₙ]ᵀ for P(x) = a₀ + a₁x + a₂x² + ... + aₙxⁿ

P_vandermonde(coef, x_interp)
- Evaluates the Vandermonde polynomial at specified points
- Builds the evaluation matrix and computes polynomial values
- Returns interpolated values y_interp
