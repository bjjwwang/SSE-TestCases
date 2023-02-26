; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Strncat_Overflow_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Strncat_Overflow_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"Hello\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %retval = alloca i32, align 4
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  %r = alloca i32, align 4
  %a = alloca i8, align 1
  %a_as_int = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !16, metadata !DIExpression()), !dbg !18
  %call = call noalias align 16 i8* @malloc(i64 128) #5, !dbg !19
  store i8* %call, i8** %dest, align 8, !dbg !18
  %0 = load i8*, i8** %dest, align 8, !dbg !20
  %call1 = call i8* @strcpy(i8* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)) #5, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %src, metadata !22, metadata !DIExpression()), !dbg !23
  %call2 = call noalias align 16 i8* @malloc(i64 128) #5, !dbg !24
  store i8* %call2, i8** %src, align 8, !dbg !23
  %1 = load i8*, i8** %src, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 97, i64 128, i1 false), !dbg !26
  %2 = load i8*, i8** %src, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 127, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %call3 = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !29
  call void @srand(i32 %call3) #5, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %r, metadata !31, metadata !DIExpression()), !dbg !32
  %call4 = call i32 @rand() #5, !dbg !33
  %rem = srem i32 %call4, 128, !dbg !34
  store i32 %rem, i32* %r, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i8* %a, metadata !35, metadata !DIExpression()), !dbg !36
  %3 = load i32, i32* %r, align 4, !dbg !37
  %conv = trunc i32 %3 to i8, !dbg !38
  store i8 %conv, i8* %a, align 1, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %a_as_int, metadata !39, metadata !DIExpression()), !dbg !40
  %4 = load i8, i8* %a, align 1, !dbg !41
  %conv5 = sext i8 %4 to i32, !dbg !42
  store i32 %conv5, i32* %a_as_int, align 4, !dbg !40
  %5 = load i8, i8* %a, align 1, !dbg !43
  %conv6 = sext i8 %5 to i32, !dbg !43
  %cmp = icmp sge i32 %conv6, 97, !dbg !45
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !46

land.lhs.true:                                    ; preds = %entry
  %6 = load i8, i8* %a, align 1, !dbg !47
  %conv8 = sext i8 %6 to i32, !dbg !47
  %cmp9 = icmp sle i32 %conv8, 122, !dbg !48
  br i1 %cmp9, label %if.then, label %if.else, !dbg !49

if.then:                                          ; preds = %land.lhs.true
  %7 = load i8*, i8** %dest, align 8, !dbg !50
  %8 = load i8*, i8** %src, align 8, !dbg !52
  %9 = load i32, i32* %a_as_int, align 4, !dbg !53
  %conv11 = sext i32 %9 to i64, !dbg !53
  %call12 = call i8* @strncat(i8* %7, i8* %8, i64 %conv11) #5, !dbg !54
  br label %if.end, !dbg !55

if.else:                                          ; preds = %land.lhs.true, %entry
  %10 = load i8*, i8** %dest, align 8, !dbg !56
  %11 = load i8*, i8** %src, align 8, !dbg !58
  %12 = load i32, i32* %a_as_int, align 4, !dbg !59
  %conv13 = sext i32 %12 to i64, !dbg !59
  %call14 = call i8* @strncat(i8* %10, i8* %11, i64 %conv13) #5, !dbg !60
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !61
  ret i32 %13, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #4

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Strncat_Overflow_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Strncat_Overflow_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!5}
!16 = !DILocalVariable(name: "dest", scope: !12, file: !13, line: 8, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!18 = !DILocation(line: 8, column: 8, scope: !12)
!19 = !DILocation(line: 8, column: 15, scope: !12)
!20 = !DILocation(line: 9, column: 9, scope: !12)
!21 = !DILocation(line: 9, column: 2, scope: !12)
!22 = !DILocalVariable(name: "src", scope: !12, file: !13, line: 10, type: !17)
!23 = !DILocation(line: 10, column: 8, scope: !12)
!24 = !DILocation(line: 10, column: 14, scope: !12)
!25 = !DILocation(line: 11, column: 9, scope: !12)
!26 = !DILocation(line: 11, column: 2, scope: !12)
!27 = !DILocation(line: 12, column: 2, scope: !12)
!28 = !DILocation(line: 12, column: 11, scope: !12)
!29 = !DILocation(line: 14, column: 11, scope: !12)
!30 = !DILocation(line: 14, column: 5, scope: !12)
!31 = !DILocalVariable(name: "r", scope: !12, file: !13, line: 15, type: !5)
!32 = !DILocation(line: 15, column: 6, scope: !12)
!33 = !DILocation(line: 15, column: 10, scope: !12)
!34 = !DILocation(line: 15, column: 17, scope: !12)
!35 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 16, type: !4)
!36 = !DILocation(line: 16, column: 10, scope: !12)
!37 = !DILocation(line: 16, column: 20, scope: !12)
!38 = !DILocation(line: 16, column: 14, scope: !12)
!39 = !DILocalVariable(name: "a_as_int", scope: !12, file: !13, line: 17, type: !5)
!40 = !DILocation(line: 17, column: 9, scope: !12)
!41 = !DILocation(line: 17, column: 25, scope: !12)
!42 = !DILocation(line: 17, column: 20, scope: !12)
!43 = !DILocation(line: 18, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !12, file: !13, line: 18, column: 9)
!45 = !DILocation(line: 18, column: 11, scope: !44)
!46 = !DILocation(line: 18, column: 18, scope: !44)
!47 = !DILocation(line: 18, column: 21, scope: !44)
!48 = !DILocation(line: 18, column: 23, scope: !44)
!49 = !DILocation(line: 18, column: 9, scope: !12)
!50 = !DILocation(line: 20, column: 11, scope: !51)
!51 = distinct !DILexicalBlock(scope: !44, file: !13, line: 18, column: 31)
!52 = !DILocation(line: 20, column: 17, scope: !51)
!53 = !DILocation(line: 20, column: 22, scope: !51)
!54 = !DILocation(line: 20, column: 3, scope: !51)
!55 = !DILocation(line: 21, column: 5, scope: !51)
!56 = !DILocation(line: 24, column: 11, scope: !57)
!57 = distinct !DILexicalBlock(scope: !44, file: !13, line: 22, column: 7)
!58 = !DILocation(line: 24, column: 17, scope: !57)
!59 = !DILocation(line: 24, column: 22, scope: !57)
!60 = !DILocation(line: 24, column: 3, scope: !57)
!61 = !DILocation(line: 26, column: 1, scope: !12)
