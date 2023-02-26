; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !32
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  call void %4(i8* noundef %5), !dbg !35
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i8* noundef %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !47
  %1 = load i8*, i8** %data.addr, align 8, !dbg !47
  %2 = load i8*, i8** %data.addr, align 8, !dbg !47
  %call = call i64 @strlen(i8* noundef %2), !dbg !47
  %mul = mul i64 %call, 1, !dbg !47
  %call1 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %mul, i64 noundef 50) #5, !dbg !47
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %3 = load i8*, i8** %data.addr, align 8, !dbg !50
  call void @printLine(i8* noundef %3), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !78, metadata !DIExpression()), !dbg !79
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i8* %arraydecay, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %1 = load i8*, i8** %data, align 8, !dbg !84
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !84
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !84
  %3 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !87
  %5 = load i8*, i8** %data, align 8, !dbg !88
  call void %4(i8* noundef %5), !dbg !87
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i8* noundef %data) #0 !dbg !90 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !96
  %1 = load i8*, i8** %data.addr, align 8, !dbg !96
  %2 = load i8*, i8** %data.addr, align 8, !dbg !96
  %call = call i64 @strlen(i8* noundef %2), !dbg !96
  %mul = mul i64 %call, 1, !dbg !96
  %call1 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %mul, i64 noundef 50) #5, !dbg !96
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %3 = load i8*, i8** %data.addr, align 8, !dbg !99
  call void @printLine(i8* noundef %3), !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44_bad", scope: !12, file: !12, line: 34, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 36, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 36, column: 12, scope: !11)
!20 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 38, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !17}
!24 = !DILocation(line: 38, column: 12, scope: !11)
!25 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 39, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 39, column: 10, scope: !11)
!30 = !DILocation(line: 40, column: 12, scope: !11)
!31 = !DILocation(line: 40, column: 10, scope: !11)
!32 = !DILocation(line: 42, column: 5, scope: !11)
!33 = !DILocation(line: 43, column: 5, scope: !11)
!34 = !DILocation(line: 43, column: 17, scope: !11)
!35 = !DILocation(line: 45, column: 5, scope: !11)
!36 = !DILocation(line: 45, column: 13, scope: !11)
!37 = !DILocation(line: 46, column: 1, scope: !11)
!38 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!39 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !12, line: 23, type: !17)
!40 = !DILocation(line: 23, column: 28, scope: !38)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 26, type: !43)
!42 = distinct !DILexicalBlock(scope: !38, file: !12, line: 25, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 26, column: 14, scope: !42)
!47 = !DILocation(line: 28, column: 9, scope: !42)
!48 = !DILocation(line: 29, column: 9, scope: !42)
!49 = !DILocation(line: 29, column: 20, scope: !42)
!50 = !DILocation(line: 30, column: 19, scope: !42)
!51 = !DILocation(line: 30, column: 9, scope: !42)
!52 = !DILocation(line: 32, column: 1, scope: !38)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memmove_44_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!54 = !DILocation(line: 78, column: 5, scope: !53)
!55 = !DILocation(line: 79, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !57, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 90, type: !59)
!62 = !DILocation(line: 90, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 90, type: !60)
!64 = !DILocation(line: 90, column: 27, scope: !56)
!65 = !DILocation(line: 93, column: 22, scope: !56)
!66 = !DILocation(line: 93, column: 12, scope: !56)
!67 = !DILocation(line: 93, column: 5, scope: !56)
!68 = !DILocation(line: 95, column: 5, scope: !56)
!69 = !DILocation(line: 96, column: 5, scope: !56)
!70 = !DILocation(line: 97, column: 5, scope: !56)
!71 = !DILocation(line: 100, column: 5, scope: !56)
!72 = !DILocation(line: 101, column: 5, scope: !56)
!73 = !DILocation(line: 102, column: 5, scope: !56)
!74 = !DILocation(line: 104, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 66, type: !17)
!77 = !DILocation(line: 66, column: 12, scope: !75)
!78 = !DILocalVariable(name: "funcPtr", scope: !75, file: !12, line: 67, type: !21)
!79 = !DILocation(line: 67, column: 12, scope: !75)
!80 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !12, line: 68, type: !26)
!81 = !DILocation(line: 68, column: 10, scope: !75)
!82 = !DILocation(line: 69, column: 12, scope: !75)
!83 = !DILocation(line: 69, column: 10, scope: !75)
!84 = !DILocation(line: 71, column: 5, scope: !75)
!85 = !DILocation(line: 72, column: 5, scope: !75)
!86 = !DILocation(line: 72, column: 16, scope: !75)
!87 = !DILocation(line: 73, column: 5, scope: !75)
!88 = !DILocation(line: 73, column: 13, scope: !75)
!89 = !DILocation(line: 74, column: 1, scope: !75)
!90 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 53, type: !22, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DILocalVariable(name: "data", arg: 1, scope: !90, file: !12, line: 53, type: !17)
!92 = !DILocation(line: 53, column: 32, scope: !90)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !12, line: 56, type: !43)
!94 = distinct !DILexicalBlock(scope: !90, file: !12, line: 55, column: 5)
!95 = !DILocation(line: 56, column: 14, scope: !94)
!96 = !DILocation(line: 58, column: 9, scope: !94)
!97 = !DILocation(line: 59, column: 9, scope: !94)
!98 = !DILocation(line: 59, column: 20, scope: !94)
!99 = !DILocation(line: 60, column: 19, scope: !94)
!100 = !DILocation(line: 60, column: 9, scope: !94)
!101 = !DILocation(line: 62, column: 1, scope: !90)
