function weighted_moment(img_raw, list_idx, p, q)
    M_pqr = 0.
    for idx_ = list_idx
        (x, y) = Tuple(idx_)
        M_pqr += x ^ p * y ^ q * img_raw[x, y]
    end
    M_pqr
end

function weighted_centroid(img_raw, list_idx, int_idx::Bool=true)
    M_0 = weighted_moment(img_raw, list_idx, 0, 0)
    x_bar = weighted_moment(img_raw, list_idx, 1, 0) / M_0
    y_bar = weighted_moment(img_raw, list_idx, 0, 1) / M_0

    if int_idx
        return round.(Int, (x_bar, y_bar))
    else
        return (x_bar, y_bar)
    end
end
