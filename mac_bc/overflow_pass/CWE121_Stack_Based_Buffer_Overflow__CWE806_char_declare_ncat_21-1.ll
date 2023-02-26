; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !11

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !34
  store i32 1, i32* @badStatic, align 4, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %call = call i8* @badSource(i8* noundef %0), !dbg !37
  store i8* %call, i8** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i64 @strlen(i8* noundef %3), !dbg !45
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %2, i64 noundef %call2, i64 noundef 50) #5, !dbg !45
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !46
  store i8 0, i8* %arrayidx, align 1, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* noundef %4), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @badSource(i8* noundef %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32, i32* @badStatic, align 4, !dbg !56
  %tobool = icmp ne i32 %0, 0, !dbg !56
  br i1 %tobool, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !59
  %2 = load i8*, i8** %data.addr, align 8, !dbg !59
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !59
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !59
  %4 = load i8*, i8** %data.addr, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  br label %if.end, !dbg !63

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !64
  ret i8* %5, !dbg !65
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* noundef null), !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 noundef %conv), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !93
  store i8* %arraydecay, i8** %data, align 8, !dbg !94
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !95
  %0 = load i8*, i8** %data, align 8, !dbg !96
  %call = call i8* @goodG2B1Source(i8* noundef %0), !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !101
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !102
  %2 = load i8*, i8** %data, align 8, !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !102
  %call2 = call i64 @strlen(i8* noundef %3), !dbg !102
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %2, i64 noundef %call2, i64 noundef 50) #5, !dbg !102
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %4 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* noundef %4), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @goodG2B1Source(i8* noundef %data) #0 !dbg !108 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !117
  %2 = load i8*, i8** %data.addr, align 8, !dbg !117
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !117
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !117
  %4 = load i8*, i8** %data.addr, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i8*, i8** %data.addr, align 8, !dbg !121
  ret i8* %5, !dbg !122
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !123 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !128
  store i8* %arraydecay, i8** %data, align 8, !dbg !129
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !130
  %0 = load i8*, i8** %data, align 8, !dbg !131
  %call = call i8* @goodG2B2Source(i8* noundef %0), !dbg !132
  store i8* %call, i8** %data, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !136
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !137
  %2 = load i8*, i8** %data, align 8, !dbg !137
  %3 = load i8*, i8** %data, align 8, !dbg !137
  %call2 = call i64 @strlen(i8* noundef %3), !dbg !137
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %2, i64 noundef %call2, i64 noundef 50) #5, !dbg !137
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !138
  store i8 0, i8* %arrayidx, align 1, !dbg !139
  %4 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* noundef %4), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @goodG2B2Source(i8* noundef %data) #0 !dbg !143 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !146
  %tobool = icmp ne i32 %0, 0, !dbg !146
  br i1 %tobool, label %if.then, label %if.end, !dbg !148

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !149
  %2 = load i8*, i8** %data.addr, align 8, !dbg !149
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !149
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !149
  %4 = load i8*, i8** %data.addr, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !151
  store i8 0, i8* %arrayidx, align 1, !dbg !152
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !154
  ret i8* %5, !dbg !155
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !9, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7, !11}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !9, line: 58, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !9, line: 59, type: !10, isLocal: true, isDefinition: true)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_bad", scope: !9, file: !9, line: 37, type: !21, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !9, line: 39, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!26 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!27 = !DILocation(line: 39, column: 12, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !9, line: 40, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 40, column: 10, scope: !20)
!33 = !DILocation(line: 41, column: 12, scope: !20)
!34 = !DILocation(line: 41, column: 10, scope: !20)
!35 = !DILocation(line: 42, column: 15, scope: !20)
!36 = !DILocation(line: 43, column: 22, scope: !20)
!37 = !DILocation(line: 43, column: 12, scope: !20)
!38 = !DILocation(line: 43, column: 10, scope: !20)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !9, line: 45, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !9, line: 44, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 45, column: 14, scope: !40)
!45 = !DILocation(line: 47, column: 9, scope: !40)
!46 = !DILocation(line: 48, column: 9, scope: !40)
!47 = !DILocation(line: 48, column: 20, scope: !40)
!48 = !DILocation(line: 49, column: 19, scope: !40)
!49 = !DILocation(line: 49, column: 9, scope: !40)
!50 = !DILocation(line: 51, column: 1, scope: !20)
!51 = distinct !DISubprogram(name: "badSource", scope: !9, file: !9, line: 26, type: !52, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!52 = !DISubroutineType(types: !53)
!53 = !{!25, !25}
!54 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !9, line: 26, type: !25)
!55 = !DILocation(line: 26, column: 32, scope: !51)
!56 = !DILocation(line: 28, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !9, line: 28, column: 8)
!58 = !DILocation(line: 28, column: 8, scope: !51)
!59 = !DILocation(line: 31, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !9, line: 29, column: 5)
!61 = !DILocation(line: 32, column: 9, scope: !60)
!62 = !DILocation(line: 32, column: 21, scope: !60)
!63 = !DILocation(line: 33, column: 5, scope: !60)
!64 = !DILocation(line: 34, column: 12, scope: !51)
!65 = !DILocation(line: 34, column: 5, scope: !51)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_21_good", scope: !9, file: !9, line: 122, type: !21, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!67 = !DILocation(line: 124, column: 5, scope: !66)
!68 = !DILocation(line: 125, column: 5, scope: !66)
!69 = !DILocation(line: 126, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 138, type: !71, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!71 = !DISubroutineType(types: !72)
!72 = !{!10, !10, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !9, line: 138, type: !10)
!75 = !DILocation(line: 138, column: 14, scope: !70)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !9, line: 138, type: !73)
!77 = !DILocation(line: 138, column: 27, scope: !70)
!78 = !DILocation(line: 141, column: 22, scope: !70)
!79 = !DILocation(line: 141, column: 12, scope: !70)
!80 = !DILocation(line: 141, column: 5, scope: !70)
!81 = !DILocation(line: 143, column: 5, scope: !70)
!82 = !DILocation(line: 144, column: 5, scope: !70)
!83 = !DILocation(line: 145, column: 5, scope: !70)
!84 = !DILocation(line: 148, column: 5, scope: !70)
!85 = !DILocation(line: 149, column: 5, scope: !70)
!86 = !DILocation(line: 150, column: 5, scope: !70)
!87 = !DILocation(line: 152, column: 5, scope: !70)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!89 = !DILocalVariable(name: "data", scope: !88, file: !9, line: 80, type: !25)
!90 = !DILocation(line: 80, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !9, line: 81, type: !29)
!92 = !DILocation(line: 81, column: 10, scope: !88)
!93 = !DILocation(line: 82, column: 12, scope: !88)
!94 = !DILocation(line: 82, column: 10, scope: !88)
!95 = !DILocation(line: 83, column: 20, scope: !88)
!96 = !DILocation(line: 84, column: 27, scope: !88)
!97 = !DILocation(line: 84, column: 12, scope: !88)
!98 = !DILocation(line: 84, column: 10, scope: !88)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !9, line: 86, type: !41)
!100 = distinct !DILexicalBlock(scope: !88, file: !9, line: 85, column: 5)
!101 = !DILocation(line: 86, column: 14, scope: !100)
!102 = !DILocation(line: 88, column: 9, scope: !100)
!103 = !DILocation(line: 89, column: 9, scope: !100)
!104 = !DILocation(line: 89, column: 20, scope: !100)
!105 = !DILocation(line: 90, column: 19, scope: !100)
!106 = !DILocation(line: 90, column: 9, scope: !100)
!107 = !DILocation(line: 92, column: 1, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1Source", scope: !9, file: !9, line: 62, type: !52, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!109 = !DILocalVariable(name: "data", arg: 1, scope: !108, file: !9, line: 62, type: !25)
!110 = !DILocation(line: 62, column: 37, scope: !108)
!111 = !DILocation(line: 64, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !9, line: 64, column: 8)
!113 = !DILocation(line: 64, column: 8, scope: !108)
!114 = !DILocation(line: 67, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !9, line: 65, column: 5)
!116 = !DILocation(line: 68, column: 5, scope: !115)
!117 = !DILocation(line: 72, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !9, line: 70, column: 5)
!119 = !DILocation(line: 73, column: 9, scope: !118)
!120 = !DILocation(line: 73, column: 20, scope: !118)
!121 = !DILocation(line: 75, column: 12, scope: !108)
!122 = !DILocation(line: 75, column: 5, scope: !108)
!123 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!124 = !DILocalVariable(name: "data", scope: !123, file: !9, line: 108, type: !25)
!125 = !DILocation(line: 108, column: 12, scope: !123)
!126 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !9, line: 109, type: !29)
!127 = !DILocation(line: 109, column: 10, scope: !123)
!128 = !DILocation(line: 110, column: 12, scope: !123)
!129 = !DILocation(line: 110, column: 10, scope: !123)
!130 = !DILocation(line: 111, column: 20, scope: !123)
!131 = !DILocation(line: 112, column: 27, scope: !123)
!132 = !DILocation(line: 112, column: 12, scope: !123)
!133 = !DILocation(line: 112, column: 10, scope: !123)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !9, line: 114, type: !41)
!135 = distinct !DILexicalBlock(scope: !123, file: !9, line: 113, column: 5)
!136 = !DILocation(line: 114, column: 14, scope: !135)
!137 = !DILocation(line: 116, column: 9, scope: !135)
!138 = !DILocation(line: 117, column: 9, scope: !135)
!139 = !DILocation(line: 117, column: 20, scope: !135)
!140 = !DILocation(line: 118, column: 19, scope: !135)
!141 = !DILocation(line: 118, column: 9, scope: !135)
!142 = !DILocation(line: 120, column: 1, scope: !123)
!143 = distinct !DISubprogram(name: "goodG2B2Source", scope: !9, file: !9, line: 95, type: !52, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!144 = !DILocalVariable(name: "data", arg: 1, scope: !143, file: !9, line: 95, type: !25)
!145 = !DILocation(line: 95, column: 37, scope: !143)
!146 = !DILocation(line: 97, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !9, line: 97, column: 8)
!148 = !DILocation(line: 97, column: 8, scope: !143)
!149 = !DILocation(line: 100, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !9, line: 98, column: 5)
!151 = !DILocation(line: 101, column: 9, scope: !150)
!152 = !DILocation(line: 101, column: 20, scope: !150)
!153 = !DILocation(line: 102, column: 5, scope: !150)
!154 = !DILocation(line: 103, column: 12, scope: !143)
!155 = !DILocation(line: 103, column: 5, scope: !143)
