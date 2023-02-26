; ModuleID = 'linux_bc/unpass/SYS_ctime_difftime.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/unpass/SYS_ctime_difftime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %now = alloca i64, align 8
  %newyear = alloca %struct.tm, align 8
  %newyear2 = alloca %struct.tm, align 8
  %seconds = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %now, metadata !14, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %struct.tm* %newyear, metadata !21, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %struct.tm* %newyear2, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata double* %seconds, metadata !42, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* %now) #6, !dbg !45
  %call1 = call %struct.tm* @localtime(i64* %now) #6, !dbg !46
  %0 = bitcast %struct.tm* %newyear to i8*, !dbg !47
  %1 = bitcast %struct.tm* %call1 to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 56, i1 false), !dbg !47
  %tm_hour = getelementptr inbounds %struct.tm, %struct.tm* %newyear, i32 0, i32 2, !dbg !48
  store i32 0, i32* %tm_hour, align 8, !dbg !49
  %tm_min = getelementptr inbounds %struct.tm, %struct.tm* %newyear, i32 0, i32 1, !dbg !50
  store i32 0, i32* %tm_min, align 4, !dbg !51
  %tm_sec = getelementptr inbounds %struct.tm, %struct.tm* %newyear, i32 0, i32 0, !dbg !52
  store i32 0, i32* %tm_sec, align 8, !dbg !53
  %tm_mon = getelementptr inbounds %struct.tm, %struct.tm* %newyear, i32 0, i32 4, !dbg !54
  store i32 0, i32* %tm_mon, align 8, !dbg !55
  %tm_mday = getelementptr inbounds %struct.tm, %struct.tm* %newyear, i32 0, i32 3, !dbg !56
  store i32 1, i32* %tm_mday, align 4, !dbg !57
  %call2 = call %struct.tm* @localtime(i64* %now) #6, !dbg !58
  %2 = bitcast %struct.tm* %newyear2 to i8*, !dbg !59
  %3 = bitcast %struct.tm* %call2 to i8*, !dbg !59
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 8 %3, i64 56, i1 false), !dbg !59
  %tm_hour3 = getelementptr inbounds %struct.tm, %struct.tm* %newyear2, i32 0, i32 2, !dbg !60
  store i32 0, i32* %tm_hour3, align 8, !dbg !61
  %tm_min4 = getelementptr inbounds %struct.tm, %struct.tm* %newyear2, i32 0, i32 1, !dbg !62
  store i32 0, i32* %tm_min4, align 4, !dbg !63
  %tm_sec5 = getelementptr inbounds %struct.tm, %struct.tm* %newyear2, i32 0, i32 0, !dbg !64
  store i32 1, i32* %tm_sec5, align 8, !dbg !65
  %tm_mon6 = getelementptr inbounds %struct.tm, %struct.tm* %newyear2, i32 0, i32 4, !dbg !66
  store i32 0, i32* %tm_mon6, align 8, !dbg !67
  %tm_mday7 = getelementptr inbounds %struct.tm, %struct.tm* %newyear2, i32 0, i32 3, !dbg !68
  store i32 1, i32* %tm_mday7, align 4, !dbg !69
  %call8 = call i64 @mktime(%struct.tm* %newyear2) #6, !dbg !70
  %call9 = call i64 @mktime(%struct.tm* %newyear) #6, !dbg !71
  %call10 = call double @difftime(i64 %call8, i64 %call9) #7, !dbg !72
  store double %call10, double* %seconds, align 8, !dbg !73
  %4 = load double, double* %seconds, align 8, !dbg !74
  %cmp = fcmp oeq double %4, 1.000000e+00, !dbg !75
  call void @svf_assert(i1 zeroext %cmp), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local %struct.tm* @localtime(i64*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readnone willreturn
declare dso_local double @difftime(i64, i64) #4

; Function Attrs: nounwind
declare dso_local i64 @mktime(%struct.tm*) #2

declare dso_local void @svf_assert(i1 zeroext) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/unpass/SYS_ctime_difftime.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/unpass/SYS_ctime_difftime.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "now", scope: !9, file: !10, line: 6, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !16, line: 7, baseType: !17)
!16 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !18, line: 160, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DILocation(line: 6, column: 12, scope: !9)
!21 = !DILocalVariable(name: "newyear", scope: !9, file: !10, line: 7, type: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !23, line: 7, size: 448, elements: !24)
!23 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "")
!24 = !{!25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !22, file: !23, line: 9, baseType: !13, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !22, file: !23, line: 10, baseType: !13, size: 32, offset: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !22, file: !23, line: 11, baseType: !13, size: 32, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !22, file: !23, line: 12, baseType: !13, size: 32, offset: 96)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !22, file: !23, line: 13, baseType: !13, size: 32, offset: 128)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !22, file: !23, line: 14, baseType: !13, size: 32, offset: 160)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !22, file: !23, line: 15, baseType: !13, size: 32, offset: 192)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !22, file: !23, line: 16, baseType: !13, size: 32, offset: 224)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !22, file: !23, line: 17, baseType: !13, size: 32, offset: 256)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !22, file: !23, line: 20, baseType: !19, size: 64, offset: 320)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !22, file: !23, line: 21, baseType: !36, size: 64, offset: 384)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !DILocation(line: 7, column: 15, scope: !9)
!40 = !DILocalVariable(name: "newyear2", scope: !9, file: !10, line: 8, type: !22)
!41 = !DILocation(line: 8, column: 15, scope: !9)
!42 = !DILocalVariable(name: "seconds", scope: !9, file: !10, line: 9, type: !43)
!43 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!44 = !DILocation(line: 9, column: 12, scope: !9)
!45 = !DILocation(line: 11, column: 5, scope: !9)
!46 = !DILocation(line: 12, column: 16, scope: !9)
!47 = !DILocation(line: 12, column: 15, scope: !9)
!48 = !DILocation(line: 14, column: 13, scope: !9)
!49 = !DILocation(line: 14, column: 21, scope: !9)
!50 = !DILocation(line: 14, column: 34, scope: !9)
!51 = !DILocation(line: 14, column: 41, scope: !9)
!52 = !DILocation(line: 14, column: 54, scope: !9)
!53 = !DILocation(line: 14, column: 61, scope: !9)
!54 = !DILocation(line: 15, column: 13, scope: !9)
!55 = !DILocation(line: 15, column: 20, scope: !9)
!56 = !DILocation(line: 15, column: 34, scope: !9)
!57 = !DILocation(line: 15, column: 42, scope: !9)
!58 = !DILocation(line: 17, column: 17, scope: !9)
!59 = !DILocation(line: 17, column: 16, scope: !9)
!60 = !DILocation(line: 19, column: 14, scope: !9)
!61 = !DILocation(line: 19, column: 22, scope: !9)
!62 = !DILocation(line: 19, column: 36, scope: !9)
!63 = !DILocation(line: 19, column: 43, scope: !9)
!64 = !DILocation(line: 19, column: 57, scope: !9)
!65 = !DILocation(line: 19, column: 64, scope: !9)
!66 = !DILocation(line: 20, column: 14, scope: !9)
!67 = !DILocation(line: 20, column: 21, scope: !9)
!68 = !DILocation(line: 20, column: 36, scope: !9)
!69 = !DILocation(line: 20, column: 44, scope: !9)
!70 = !DILocation(line: 22, column: 24, scope: !9)
!71 = !DILocation(line: 22, column: 42, scope: !9)
!72 = !DILocation(line: 22, column: 15, scope: !9)
!73 = !DILocation(line: 22, column: 13, scope: !9)
!74 = !DILocation(line: 24, column: 16, scope: !9)
!75 = !DILocation(line: 24, column: 24, scope: !9)
!76 = !DILocation(line: 24, column: 5, scope: !9)
!77 = !DILocation(line: 26, column: 5, scope: !9)
