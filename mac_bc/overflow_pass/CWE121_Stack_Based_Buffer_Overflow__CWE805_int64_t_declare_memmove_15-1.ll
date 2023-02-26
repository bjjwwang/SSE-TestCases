; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i64* %arraydecay, i64** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !36
  %1 = load i64*, i64** %data, align 8, !dbg !37
  %2 = bitcast i64* %1 to i8*, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !37
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !37
  %4 = load i64*, i64** %data, align 8, !dbg !37
  %5 = bitcast i64* %4 to i8*, !dbg !37
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !37
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !37
  %7 = load i64*, i64** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !38
  %8 = load i64, i64* %arrayidx, align 8, !dbg !38
  call void @printLongLongLine(i64 noundef %8), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15_good() #0 !dbg !41 {
entry:
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* noundef null), !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 noundef %conv), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15_good(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15_bad(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !73
  store i64* %arraydecay, i64** %data, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !75, metadata !DIExpression()), !dbg !77
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !77
  %1 = load i64*, i64** %data, align 8, !dbg !78
  %2 = bitcast i64* %1 to i8*, !dbg !78
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !78
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !78
  %4 = load i64*, i64** %data, align 8, !dbg !78
  %5 = bitcast i64* %4 to i8*, !dbg !78
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !78
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !78
  %7 = load i64*, i64** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !79
  %8 = load i64, i64* %arrayidx, align 8, !dbg !79
  call void @printLongLongLine(i64 noundef %8), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !82 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !89
  store i64* %arraydecay, i64** %data, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !93
  %1 = load i64*, i64** %data, align 8, !dbg !94
  %2 = bitcast i64* %1 to i8*, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !94
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !94
  %4 = load i64*, i64** %data, align 8, !dbg !94
  %5 = bitcast i64* %4 to i8*, !dbg !94
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !94
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !94
  %7 = load i64*, i64** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !95
  %8 = load i64, i64* %arrayidx, align 8, !dbg !95
  call void @printLongLongLine(i64 noundef %8), !dbg !96
  ret void, !dbg !97
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 23, column: 15, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 24, column: 13, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 25, column: 13, scope: !11)
!32 = !DILocation(line: 31, column: 16, scope: !11)
!33 = !DILocation(line: 31, column: 14, scope: !11)
!34 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 39, type: !28)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!36 = !DILocation(line: 39, column: 17, scope: !35)
!37 = !DILocation(line: 41, column: 9, scope: !35)
!38 = !DILocation(line: 42, column: 27, scope: !35)
!39 = !DILocation(line: 42, column: 9, scope: !35)
!40 = !DILocation(line: 44, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_15_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!42 = !DILocation(line: 102, column: 5, scope: !41)
!43 = !DILocation(line: 103, column: 5, scope: !41)
!44 = !DILocation(line: 104, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !46, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 116, type: !48)
!53 = !DILocation(line: 116, column: 14, scope: !45)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 116, type: !49)
!55 = !DILocation(line: 116, column: 27, scope: !45)
!56 = !DILocation(line: 119, column: 22, scope: !45)
!57 = !DILocation(line: 119, column: 12, scope: !45)
!58 = !DILocation(line: 119, column: 5, scope: !45)
!59 = !DILocation(line: 121, column: 5, scope: !45)
!60 = !DILocation(line: 122, column: 5, scope: !45)
!61 = !DILocation(line: 123, column: 5, scope: !45)
!62 = !DILocation(line: 126, column: 5, scope: !45)
!63 = !DILocation(line: 127, column: 5, scope: !45)
!64 = !DILocation(line: 128, column: 5, scope: !45)
!65 = !DILocation(line: 130, column: 5, scope: !45)
!66 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!67 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 53, type: !17)
!68 = !DILocation(line: 53, column: 15, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !12, line: 54, type: !23)
!70 = !DILocation(line: 54, column: 13, scope: !66)
!71 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !12, line: 55, type: !28)
!72 = !DILocation(line: 55, column: 13, scope: !66)
!73 = !DILocation(line: 64, column: 16, scope: !66)
!74 = !DILocation(line: 64, column: 14, scope: !66)
!75 = !DILocalVariable(name: "source", scope: !76, file: !12, line: 68, type: !28)
!76 = distinct !DILexicalBlock(scope: !66, file: !12, line: 67, column: 5)
!77 = !DILocation(line: 68, column: 17, scope: !76)
!78 = !DILocation(line: 70, column: 9, scope: !76)
!79 = !DILocation(line: 71, column: 27, scope: !76)
!80 = !DILocation(line: 71, column: 9, scope: !76)
!81 = !DILocation(line: 73, column: 1, scope: !66)
!82 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 78, type: !17)
!84 = !DILocation(line: 78, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 79, type: !23)
!86 = !DILocation(line: 79, column: 13, scope: !82)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 80, type: !28)
!88 = !DILocation(line: 80, column: 13, scope: !82)
!89 = !DILocation(line: 85, column: 16, scope: !82)
!90 = !DILocation(line: 85, column: 14, scope: !82)
!91 = !DILocalVariable(name: "source", scope: !92, file: !12, line: 93, type: !28)
!92 = distinct !DILexicalBlock(scope: !82, file: !12, line: 92, column: 5)
!93 = !DILocation(line: 93, column: 17, scope: !92)
!94 = !DILocation(line: 95, column: 9, scope: !92)
!95 = !DILocation(line: 96, column: 27, scope: !92)
!96 = !DILocation(line: 96, column: 9, scope: !92)
!97 = !DILocation(line: 98, column: 1, scope: !82)
