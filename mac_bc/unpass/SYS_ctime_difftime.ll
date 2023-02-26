; ModuleID = 'mac_bc/unpass/SYS_ctime_difftime.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/SYS_ctime_difftime.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i8* }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %now = alloca i64, align 8
  %newyear = alloca %struct.tm, align 8
  %newyear2 = alloca %struct.tm, align 8
  %seconds = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i64* %now, metadata !15, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %struct.tm* %newyear, metadata !22, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata %struct.tm* %newyear2, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata double* %seconds, metadata !42, metadata !DIExpression()), !dbg !44
  %call = call i64 @time(i64* noundef %now), !dbg !45
  %call1 = call %struct.tm* @localtime(i64* noundef %now), !dbg !46
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
  %call2 = call %struct.tm* @localtime(i64* noundef %now), !dbg !58
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
  %call8 = call i64 @"\01_mktime"(%struct.tm* noundef %newyear2), !dbg !70
  %call9 = call i64 @"\01_mktime"(%struct.tm* noundef %newyear), !dbg !71
  %call10 = call double @difftime(i64 noundef %call8, i64 noundef %call9), !dbg !72
  store double %call10, double* %seconds, align 8, !dbg !73
  %4 = load double, double* %seconds, align 8, !dbg !74
  %cmp = fcmp oeq double %4, 1.000000e+00, !dbg !75
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i64 @time(i64* noundef) #2

declare %struct.tm* @localtime(i64* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare double @difftime(i64 noundef, i64 noundef) #2

declare i64 @"\01_mktime"(%struct.tm* noundef) #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/SYS_ctime_difftime.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/unpass/SYS_ctime_difftime.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "now", scope: !9, file: !10, line: 6, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !17, line: 31, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_time_t.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !19, line: 122, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!20 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 6, column: 12, scope: !9)
!22 = !DILocalVariable(name: "newyear", scope: !9, file: !10, line: 7, type: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !24, line: 75, size: 448, elements: !25)
!24 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/time.h", directory: "")
!25 = !{!26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !23, file: !24, line: 76, baseType: !13, size: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !23, file: !24, line: 77, baseType: !13, size: 32, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !23, file: !24, line: 78, baseType: !13, size: 32, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !23, file: !24, line: 79, baseType: !13, size: 32, offset: 96)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !23, file: !24, line: 80, baseType: !13, size: 32, offset: 128)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !23, file: !24, line: 81, baseType: !13, size: 32, offset: 160)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !23, file: !24, line: 82, baseType: !13, size: 32, offset: 192)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !23, file: !24, line: 83, baseType: !13, size: 32, offset: 224)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !23, file: !24, line: 84, baseType: !13, size: 32, offset: 256)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !23, file: !24, line: 85, baseType: !20, size: 64, offset: 320)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !23, file: !24, line: 86, baseType: !37, size: 64, offset: 384)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!39 = !DILocation(line: 7, column: 15, scope: !9)
!40 = !DILocalVariable(name: "newyear2", scope: !9, file: !10, line: 8, type: !23)
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
