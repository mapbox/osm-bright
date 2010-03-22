/******************************************************************************
# Boundaries
*******************************************************************************/

.boundary.admin-2[zoom>1] { /* National Level */
  line-color: #00316e;
  line-opacity: 0.3;
  line-width: 0.3;
}
  .boundary.admin-2[zoom=3] { line-width: 0.4; }
  .boundary.admin-2[zoom=4] { line-width: 0.6; }
  .boundary.admin-2[zoom=5] { line-width: 0.8; }
  .boundary.admin-2[zoom=6] { line-width: 1; }
  .boundary.admin-2[zoom=7] { line-width: 1.2; }
  .boundary.admin-2[zoom=8] { line-width: 1.4; }
  .boundary.admin-2[zoom=9] { line-width: 1.6; }
  .boundary.admin-2[zoom=10] { line-width: 1.8; }
  .boundary.admin-2[zoom=11] { line-width: 2; }
  .boundary.admin-2[zoom>=12] { line-width: 2.2; }

.boundary.admin-4[zoom>=4] { /* Province-level / State-level */
  line-color: #00316e;
  line-dasharray: 8, 3;
  line-opacity: 0.3;
  line-width: 0.4;
}
  .boundary.admin-4[zoom=5] { line-width: 0.5; }
  .boundary.admin-4[zoom=6] { line-width: 0.6; }
  .boundary.admin-4[zoom=7] { line-width: 0.7; }
  .boundary.admin-4[zoom=8] { line-width: 0.8; }
  .boundary.admin-4[zoom=9] { line-width: 0.9; }
  .boundary.admin-4[zoom=10] { line-width: 1; }
  .boundary.admin-4[zoom=11] { line-width: 1.2; }
  .boundary.admin-4[zoom>=12] { line-width: 1.4; }