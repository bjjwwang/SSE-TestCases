; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !33
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx2, align 1, !dbg !35
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i8* %arraydecay3, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !42
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx5, align 1, !dbg !45
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %0 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !46
  %mul = mul i64 %call, 1, !dbg !46
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %0, i64 noundef %mul, i64 noundef 100) #5, !dbg !46
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx9, align 1, !dbg !48
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @printLine(i8* noundef %arraydecay10), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_04_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE126_Buffer_Overread__char_declare_memcpy_04_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE126_Buffer_Overread__char_declare_memcpy_04_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !82
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !85
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx2, align 1, !dbg !87
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay3, i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx5, align 1, !dbg !97
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !98
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !98
  %mul = mul i64 %call, 1, !dbg !98
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %0, i64 noundef %mul, i64 noundef 100) #5, !dbg !98
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx9, align 1, !dbg !100
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !101
  call void @printLine(i8* noundef %arraydecay10), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !111
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !114
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx2, align 1, !dbg !116
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  store i8* %arraydecay3, i8** %data, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx5, align 1, !dbg !126
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  %0 = load i8*, i8** %data, align 8, !dbg !127
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  %call = call i64 @strlen(i8* noundef %arraydecay7), !dbg !127
  %mul = mul i64 %call, 1, !dbg !127
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay6, i8* noundef %0, i64 noundef %mul, i64 noundef 100) #5, !dbg !127
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx9, align 1, !dbg !129
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @printLine(i8* noundef %arraydecay10), !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 32, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 33, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 34, column: 10, scope: !11)
!30 = !DILocation(line: 35, column: 5, scope: !11)
!31 = !DILocation(line: 36, column: 5, scope: !11)
!32 = !DILocation(line: 36, column: 25, scope: !11)
!33 = !DILocation(line: 37, column: 5, scope: !11)
!34 = !DILocation(line: 38, column: 5, scope: !11)
!35 = !DILocation(line: 38, column: 27, scope: !11)
!36 = !DILocation(line: 42, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !38, file: !12, line: 40, column: 5)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 8)
!39 = !DILocation(line: 42, column: 14, scope: !37)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 45, type: !26)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 44, column: 5)
!42 = !DILocation(line: 45, column: 14, scope: !41)
!43 = !DILocation(line: 46, column: 9, scope: !41)
!44 = !DILocation(line: 47, column: 9, scope: !41)
!45 = !DILocation(line: 47, column: 21, scope: !41)
!46 = !DILocation(line: 50, column: 9, scope: !41)
!47 = !DILocation(line: 51, column: 9, scope: !41)
!48 = !DILocation(line: 51, column: 21, scope: !41)
!49 = !DILocation(line: 52, column: 19, scope: !41)
!50 = !DILocation(line: 52, column: 9, scope: !41)
!51 = !DILocation(line: 54, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_04_good", scope: !12, file: !12, line: 119, type: !13, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!53 = !DILocation(line: 121, column: 5, scope: !52)
!54 = !DILocation(line: 122, column: 5, scope: !52)
!55 = !DILocation(line: 123, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !57, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 135, type: !59)
!62 = !DILocation(line: 135, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 135, type: !60)
!64 = !DILocation(line: 135, column: 27, scope: !56)
!65 = !DILocation(line: 138, column: 22, scope: !56)
!66 = !DILocation(line: 138, column: 12, scope: !56)
!67 = !DILocation(line: 138, column: 5, scope: !56)
!68 = !DILocation(line: 140, column: 5, scope: !56)
!69 = !DILocation(line: 141, column: 5, scope: !56)
!70 = !DILocation(line: 142, column: 5, scope: !56)
!71 = !DILocation(line: 145, column: 5, scope: !56)
!72 = !DILocation(line: 146, column: 5, scope: !56)
!73 = !DILocation(line: 147, column: 5, scope: !56)
!74 = !DILocation(line: 149, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 63, type: !17)
!77 = !DILocation(line: 63, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !12, line: 64, type: !21)
!79 = !DILocation(line: 64, column: 10, scope: !75)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !12, line: 65, type: !26)
!81 = !DILocation(line: 65, column: 10, scope: !75)
!82 = !DILocation(line: 66, column: 5, scope: !75)
!83 = !DILocation(line: 67, column: 5, scope: !75)
!84 = !DILocation(line: 67, column: 25, scope: !75)
!85 = !DILocation(line: 68, column: 5, scope: !75)
!86 = !DILocation(line: 69, column: 5, scope: !75)
!87 = !DILocation(line: 69, column: 27, scope: !75)
!88 = !DILocation(line: 78, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !12, line: 76, column: 5)
!90 = distinct !DILexicalBlock(scope: !75, file: !12, line: 70, column: 8)
!91 = !DILocation(line: 78, column: 14, scope: !89)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 81, type: !26)
!93 = distinct !DILexicalBlock(scope: !75, file: !12, line: 80, column: 5)
!94 = !DILocation(line: 81, column: 14, scope: !93)
!95 = !DILocation(line: 82, column: 9, scope: !93)
!96 = !DILocation(line: 83, column: 9, scope: !93)
!97 = !DILocation(line: 83, column: 21, scope: !93)
!98 = !DILocation(line: 86, column: 9, scope: !93)
!99 = !DILocation(line: 87, column: 9, scope: !93)
!100 = !DILocation(line: 87, column: 21, scope: !93)
!101 = !DILocation(line: 88, column: 19, scope: !93)
!102 = !DILocation(line: 88, column: 9, scope: !93)
!103 = !DILocation(line: 90, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 95, type: !17)
!106 = !DILocation(line: 95, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 96, type: !21)
!108 = !DILocation(line: 96, column: 10, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 97, type: !26)
!110 = !DILocation(line: 97, column: 10, scope: !104)
!111 = !DILocation(line: 98, column: 5, scope: !104)
!112 = !DILocation(line: 99, column: 5, scope: !104)
!113 = !DILocation(line: 99, column: 25, scope: !104)
!114 = !DILocation(line: 100, column: 5, scope: !104)
!115 = !DILocation(line: 101, column: 5, scope: !104)
!116 = !DILocation(line: 101, column: 27, scope: !104)
!117 = !DILocation(line: 105, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !12, line: 103, column: 5)
!119 = distinct !DILexicalBlock(scope: !104, file: !12, line: 102, column: 8)
!120 = !DILocation(line: 105, column: 14, scope: !118)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 108, type: !26)
!122 = distinct !DILexicalBlock(scope: !104, file: !12, line: 107, column: 5)
!123 = !DILocation(line: 108, column: 14, scope: !122)
!124 = !DILocation(line: 109, column: 9, scope: !122)
!125 = !DILocation(line: 110, column: 9, scope: !122)
!126 = !DILocation(line: 110, column: 21, scope: !122)
!127 = !DILocation(line: 113, column: 9, scope: !122)
!128 = !DILocation(line: 114, column: 9, scope: !122)
!129 = !DILocation(line: 114, column: 21, scope: !122)
!130 = !DILocation(line: 115, column: 19, scope: !122)
!131 = !DILocation(line: 115, column: 9, scope: !122)
!132 = !DILocation(line: 117, column: 1, scope: !104)
